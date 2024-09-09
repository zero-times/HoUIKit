import XCTest
@testable import HoaUIKit

final class HoaUIKitTests: XCTestCase {
    func testUIFontExtensions() throws {
        print(UIFont.h)
    }
    func testUIColorExtensions() throws {
        print(UIColor.Theme.dividingLine)
    }
    func testSnapKit() throws {
        print(UIView().snp.bottom)
    }
    func testStringExtensions() throws {
        print("".getStringWidth(font: .designKit.systemFont(ofSize: 16)))
    }
    func testHoCommonActionButton() throws {
        print("\(HoCommonActionButton(.none))")
    }
    func testHoCommonCheckRowView() throws {
        _ = HoCommonCheckRowView("title", subtitle: "subtitle")
    }
    func testHoCommonDefaultRowView() throws {
        _ = HoCommonDefaultRowView("title", subTitleStyle: .right("right"))
    }
    func testHoCommonFullTextRowView() throws {
        _ = HoCommonFullTextRowView("title", subtitle: "subtitle", detail: "detail")
    }
    func testHoCommonSectionView() throws {
        _ = HoCommonSectionView(header: HoCommonTitleHeader(), childrenView: [UIView()])
    }
    func testHoCommonSliderRowView() throws {
        _ = HoCommonSliderRowView()
    }
    func testHoCommonTitleHeader() throws {
        _ = HoCommonTitleHeader()
    }
    func testHoSnpWidthLabel() throws {
        _ = HoSnpWidthLabel()
    }
    
}
