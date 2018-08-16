import XCTest
@testable import MarkdownHero

class TestCleaner:XCTestCase {
    func testCleanMultipleSpaces() {
        let cleaned:String = Cleaner().clean(string:"hello        world")
        XCTAssertEqual(cleaned, "hello world", "Not clean")
    }
    
    func testCleanMultipleBlankLines() {
        let cleaned:String = Cleaner().clean(string:"hello\n\n\nworld")
        XCTAssertEqual(cleaned, "hello\n\nworld", "Not clean")
    }
}
