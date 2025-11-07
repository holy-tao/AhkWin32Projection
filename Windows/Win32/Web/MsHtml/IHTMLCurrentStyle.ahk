#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLCurrentStyle extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLCurrentStyle
     * @type {Guid}
     */
    static IID => Guid("{3050f3db-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCurrentStyle
     * @type {Guid}
     */
    static CLSID => Guid("{3050f3dc-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_position", "get_styleFloat", "get_color", "get_backgroundColor", "get_fontFamily", "get_fontStyle", "get_fontVariant", "get_fontWeight", "get_fontSize", "get_backgroundImage", "get_backgroundPositionX", "get_backgroundPositionY", "get_backgroundRepeat", "get_borderLeftColor", "get_borderTopColor", "get_borderRightColor", "get_borderBottomColor", "get_borderTopStyle", "get_borderRightStyle", "get_borderBottomStyle", "get_borderLeftStyle", "get_borderTopWidth", "get_borderRightWidth", "get_borderBottomWidth", "get_borderLeftWidth", "get_left", "get_top", "get_width", "get_height", "get_paddingLeft", "get_paddingTop", "get_paddingRight", "get_paddingBottom", "get_textAlign", "get_textDecoration", "get_display", "get_visibility", "get_zIndex", "get_letterSpacing", "get_lineHeight", "get_textIndent", "get_verticalAlign", "get_backgroundAttachment", "get_marginTop", "get_marginRight", "get_marginBottom", "get_marginLeft", "get_clear", "get_listStyleType", "get_listStylePosition", "get_listStyleImage", "get_clipTop", "get_clipRight", "get_clipBottom", "get_clipLeft", "get_overflow", "get_pageBreakBefore", "get_pageBreakAfter", "get_cursor", "get_tableLayout", "get_borderCollapse", "get_direction", "get_behavior", "getAttribute", "get_unicodeBidi", "get_right", "get_bottom", "get_imeMode", "get_rubyAlign", "get_rubyPosition", "get_rubyOverhang", "get_textAutospace", "get_lineBreak", "get_wordBreak", "get_textJustify", "get_textJustifyTrim", "get_textKashida", "get_blockDirection", "get_layoutGridChar", "get_layoutGridLine", "get_layoutGridMode", "get_layoutGridType", "get_borderStyle", "get_borderColor", "get_borderWidth", "get_padding", "get_margin", "get_accelerator", "get_overflowX", "get_overflowY", "get_textTransform"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_position() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_styleFloat() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_color() {
        p := VARIANT()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_backgroundColor() {
        p := VARIANT()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontFamily() {
        p := BSTR()
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontStyle() {
        p := BSTR()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontVariant() {
        p := BSTR()
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_fontWeight() {
        p := VARIANT()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_fontSize() {
        p := VARIANT()
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundImage() {
        p := BSTR()
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_backgroundPositionX() {
        p := VARIANT()
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_backgroundPositionY() {
        p := VARIANT()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundRepeat() {
        p := BSTR()
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderLeftColor() {
        p := VARIANT()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderTopColor() {
        p := VARIANT()
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderRightColor() {
        p := VARIANT()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderBottomColor() {
        p := VARIANT()
        result := ComCall(23, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderTopStyle() {
        p := BSTR()
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderRightStyle() {
        p := BSTR()
        result := ComCall(25, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderBottomStyle() {
        p := BSTR()
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderLeftStyle() {
        p := BSTR()
        result := ComCall(27, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderTopWidth() {
        p := VARIANT()
        result := ComCall(28, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderRightWidth() {
        p := VARIANT()
        result := ComCall(29, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderBottomWidth() {
        p := VARIANT()
        result := ComCall(30, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderLeftWidth() {
        p := VARIANT()
        result := ComCall(31, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_left() {
        p := VARIANT()
        result := ComCall(32, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_top() {
        p := VARIANT()
        result := ComCall(33, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_width() {
        p := VARIANT()
        result := ComCall(34, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_height() {
        p := VARIANT()
        result := ComCall(35, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingLeft() {
        p := VARIANT()
        result := ComCall(36, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingTop() {
        p := VARIANT()
        result := ComCall(37, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingRight() {
        p := VARIANT()
        result := ComCall(38, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingBottom() {
        p := VARIANT()
        result := ComCall(39, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAlign() {
        p := BSTR()
        result := ComCall(40, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textDecoration() {
        p := BSTR()
        result := ComCall(41, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_display() {
        p := BSTR()
        result := ComCall(42, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_visibility() {
        p := BSTR()
        result := ComCall(43, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_zIndex() {
        p := VARIANT()
        result := ComCall(44, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_letterSpacing() {
        p := VARIANT()
        result := ComCall(45, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_lineHeight() {
        p := VARIANT()
        result := ComCall(46, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textIndent() {
        p := VARIANT()
        result := ComCall(47, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_verticalAlign() {
        p := VARIANT()
        result := ComCall(48, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundAttachment() {
        p := BSTR()
        result := ComCall(49, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginTop() {
        p := VARIANT()
        result := ComCall(50, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginRight() {
        p := VARIANT()
        result := ComCall(51, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginBottom() {
        p := VARIANT()
        result := ComCall(52, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginLeft() {
        p := VARIANT()
        result := ComCall(53, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_clear() {
        p := BSTR()
        result := ComCall(54, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStyleType() {
        p := BSTR()
        result := ComCall(55, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStylePosition() {
        p := BSTR()
        result := ComCall(56, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStyleImage() {
        p := BSTR()
        result := ComCall(57, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_clipTop() {
        p := VARIANT()
        result := ComCall(58, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_clipRight() {
        p := VARIANT()
        result := ComCall(59, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_clipBottom() {
        p := VARIANT()
        result := ComCall(60, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_clipLeft() {
        p := VARIANT()
        result := ComCall(61, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_overflow() {
        p := BSTR()
        result := ComCall(62, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pageBreakBefore() {
        p := BSTR()
        result := ComCall(63, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pageBreakAfter() {
        p := BSTR()
        result := ComCall(64, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cursor() {
        p := BSTR()
        result := ComCall(65, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_tableLayout() {
        p := BSTR()
        result := ComCall(66, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderCollapse() {
        p := BSTR()
        result := ComCall(67, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_direction() {
        p := BSTR()
        result := ComCall(68, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_behavior() {
        p := BSTR()
        result := ComCall(69, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @param {Integer} lFlags 
     * @returns {VARIANT} 
     */
    getAttribute(strAttributeName, lFlags) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        AttributeValue := VARIANT()
        result := ComCall(70, this, "ptr", strAttributeName, "int", lFlags, "ptr", AttributeValue, "HRESULT")
        return AttributeValue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_unicodeBidi() {
        p := BSTR()
        result := ComCall(71, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_right() {
        p := VARIANT()
        result := ComCall(72, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_bottom() {
        p := VARIANT()
        result := ComCall(73, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_imeMode() {
        p := BSTR()
        result := ComCall(74, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rubyAlign() {
        p := BSTR()
        result := ComCall(75, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rubyPosition() {
        p := BSTR()
        result := ComCall(76, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rubyOverhang() {
        p := BSTR()
        result := ComCall(77, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAutospace() {
        p := BSTR()
        result := ComCall(78, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_lineBreak() {
        p := BSTR()
        result := ComCall(79, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_wordBreak() {
        p := BSTR()
        result := ComCall(80, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textJustify() {
        p := BSTR()
        result := ComCall(81, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textJustifyTrim() {
        p := BSTR()
        result := ComCall(82, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textKashida() {
        p := VARIANT()
        result := ComCall(83, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_blockDirection() {
        p := BSTR()
        result := ComCall(84, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_layoutGridChar() {
        p := VARIANT()
        result := ComCall(85, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_layoutGridLine() {
        p := VARIANT()
        result := ComCall(86, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_layoutGridMode() {
        p := BSTR()
        result := ComCall(87, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_layoutGridType() {
        p := BSTR()
        result := ComCall(88, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderStyle() {
        p := BSTR()
        result := ComCall(89, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderColor() {
        p := BSTR()
        result := ComCall(90, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderWidth() {
        p := BSTR()
        result := ComCall(91, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_padding() {
        p := BSTR()
        result := ComCall(92, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_margin() {
        p := BSTR()
        result := ComCall(93, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_accelerator() {
        p := BSTR()
        result := ComCall(94, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_overflowX() {
        p := BSTR()
        result := ComCall(95, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_overflowY() {
        p := BSTR()
        result := ComCall(96, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textTransform() {
        p := BSTR()
        result := ComCall(97, this, "ptr", p, "HRESULT")
        return p
    }
}
