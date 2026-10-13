import XCTest

// Covers the practical's test cases and captures the submission screenshots.
final class QuickTasksUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
    }

    // Scrolls with the Digital Crown until the element is on screen (the watch shows only a few rows at a time)
    @MainActor
    @discardableResult
    private func reveal(_ element: XCUIElement) -> XCUIElement {
        for _ in 0..<15 where !(element.exists && element.isHittable) {
            XCUIDevice.shared.rotateDigitalCrown(delta: 0.3, velocity: .default)
        }
        XCTAssertTrue(element.isHittable, "\(element) is not on screen\n\(app.debugDescription)")
        return element
    }

    @MainActor
    private func scrollToTop() {
        let header = app.staticTexts["completedCount"]
        for _ in 0..<15 where !(header.exists && header.isHittable) {
            XCUIDevice.shared.rotateDigitalCrown(delta: -0.3, velocity: .default)
        }
    }

    @MainActor
    private func toggle(_ title: String) -> XCUIElement {
        reveal(app.buttons["toggle-\(title)"])
    }

    @MainActor
    private func goBack() {
        let back = app.navigationBars.buttons.firstMatch
        if back.waitForExistence(timeout: 2) {
            back.tap()
        } else {
            app.swipeRight()
        }
    }

    @MainActor
    private func completedCount() -> String {
        app.staticTexts["completedCount"].label
    }

    @MainActor
    private func saveScreenshot(named name: String) {
        let attachment = XCTAttachment(screenshot: XCUIScreen.main.screenshot())
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    // Tests 1-4 - all tasks appear, toggling on and off, count updates
    @MainActor
    func testToggleTasksAndCompletionCount() {
        app.launch()

        XCTAssertTrue(app.staticTexts["completedCount"].waitForExistence(timeout: 10))
        XCTAssertEqual(completedCount(), "2 / 4 Completed")
        XCTAssertEqual(app.staticTexts["percentComplete"].label, "50% Complete")

        saveScreenshot(named: "01-Main-Screen")

        for title in ["Morning Walk", "Drink Water", "Read Notes", "Call Home"] {
            XCTAssertTrue(toggle(title).exists, "\(title) is missing")
        }
        scrollToTop()

        // Test 2 - an incomplete task becomes completed
        let drinkWater = toggle("Drink Water")
        XCTAssertEqual(drinkWater.value as? String, "Pending")
        drinkWater.tap()
        XCTAssertEqual(drinkWater.value as? String, "Completed")

        // Test 4 - completing several tasks updates the count
        toggle("Read Notes").tap()
        scrollToTop()
        XCTAssertEqual(completedCount(), "4 / 4 Completed")
        XCTAssertEqual(app.staticTexts["percentComplete"].label, "100% Complete")

        saveScreenshot(named: "02-Completed-Tasks")

        // Test 3 - tapping the same task again makes it incomplete
        let readNotes = toggle("Read Notes")
        readNotes.tap()
        XCTAssertEqual(readNotes.value as? String, "Pending")
        scrollToTop()
        XCTAssertEqual(completedCount(), "3 / 4 Completed")
    }

    // Test 5 - details show the correct, up-to-date status
    @MainActor
    func testTaskDetailShowsCurrentStatus() {
        app.launch()
        XCTAssertTrue(app.staticTexts["completedCount"].waitForExistence(timeout: 10))

        reveal(app.buttons["details-Morning Walk"]).tap()
        let status = app.staticTexts["taskStatus"]
        XCTAssertTrue(status.waitForExistence(timeout: 5))
        XCTAssertEqual(status.label, "Completed")
        XCTAssertTrue(app.staticTexts["Morning Walk"].exists)

        saveScreenshot(named: "03-Task-Detail")

        goBack()
        XCTAssertTrue(app.buttons["toggle-Morning Walk"].waitForExistence(timeout: 5))
        scrollToTop()
        toggle("Morning Walk").tap()

        reveal(app.buttons["details-Morning Walk"]).tap()
        XCTAssertTrue(status.waitForExistence(timeout: 5))
        XCTAssertEqual(status.label, "Pending")
    }
}
