import XCTest
@testable import MarkdownHero

class TestItalics:XCTestCase {
    private var parser:Hero!
    
    override func setUp() {
        parser = Hero()
    }
    
    func testParseItalicsUnderscore() {
        let expect = expectation(description:String())
        parser.parse(string:"_hello world_") { result in
            XCTAssertEqual("hello world", result.string)
            let font = result.attribute(.font, at:0, effectiveRange:nil) as! UIFont
            XCTAssertEqual(UIFontDescriptor(name:self.parser.font.familyName, size:14).withSymbolicTraits(
                .traitItalic)?.symbolicTraits, font.fontDescriptor.symbolicTraits)
            expect.fulfill()
        }
        waitForExpectations(timeout:2, handler:nil)
    }
    
    func testParseItalicsStar() {
        let expect = expectation(description:String())
        parser.parse(string:"*hello world*") { result in
            XCTAssertEqual("hello world", result.string)
            let font = result.attribute(.font, at:0, effectiveRange:nil) as! UIFont
            XCTAssertEqual(UIFontDescriptor(name:self.parser.font.familyName, size:14).withSymbolicTraits(
                .traitItalic)?.symbolicTraits, font.fontDescriptor.symbolicTraits)
            expect.fulfill()
        }
        waitForExpectations(timeout:1, handler:nil)
    }
}
