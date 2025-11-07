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
class IHTMLStyle extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLStyle
     * @type {Guid}
     */
    static IID => Guid("{3050f25e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLStyle
     * @type {Guid}
     */
    static CLSID => Guid("{3050f285-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_fontFamily", "get_fontFamily", "put_fontStyle", "get_fontStyle", "put_fontVariant", "get_fontVariant", "put_fontWeight", "get_fontWeight", "put_fontSize", "get_fontSize", "put_font", "get_font", "put_color", "get_color", "put_background", "get_background", "put_backgroundColor", "get_backgroundColor", "put_backgroundImage", "get_backgroundImage", "put_backgroundRepeat", "get_backgroundRepeat", "put_backgroundAttachment", "get_backgroundAttachment", "put_backgroundPosition", "get_backgroundPosition", "put_backgroundPositionX", "get_backgroundPositionX", "put_backgroundPositionY", "get_backgroundPositionY", "put_wordSpacing", "get_wordSpacing", "put_letterSpacing", "get_letterSpacing", "put_textDecoration", "get_textDecoration", "put_textDecorationNone", "get_textDecorationNone", "put_textDecorationUnderline", "get_textDecorationUnderline", "put_textDecorationOverline", "get_textDecorationOverline", "put_textDecorationLineThrough", "get_textDecorationLineThrough", "put_textDecorationBlink", "get_textDecorationBlink", "put_verticalAlign", "get_verticalAlign", "put_textTransform", "get_textTransform", "put_textAlign", "get_textAlign", "put_textIndent", "get_textIndent", "put_lineHeight", "get_lineHeight", "put_marginTop", "get_marginTop", "put_marginRight", "get_marginRight", "put_marginBottom", "get_marginBottom", "put_marginLeft", "get_marginLeft", "put_margin", "get_margin", "put_paddingTop", "get_paddingTop", "put_paddingRight", "get_paddingRight", "put_paddingBottom", "get_paddingBottom", "put_paddingLeft", "get_paddingLeft", "put_padding", "get_padding", "put_border", "get_border", "put_borderTop", "get_borderTop", "put_borderRight", "get_borderRight", "put_borderBottom", "get_borderBottom", "put_borderLeft", "get_borderLeft", "put_borderColor", "get_borderColor", "put_borderTopColor", "get_borderTopColor", "put_borderRightColor", "get_borderRightColor", "put_borderBottomColor", "get_borderBottomColor", "put_borderLeftColor", "get_borderLeftColor", "put_borderWidth", "get_borderWidth", "put_borderTopWidth", "get_borderTopWidth", "put_borderRightWidth", "get_borderRightWidth", "put_borderBottomWidth", "get_borderBottomWidth", "put_borderLeftWidth", "get_borderLeftWidth", "put_borderStyle", "get_borderStyle", "put_borderTopStyle", "get_borderTopStyle", "put_borderRightStyle", "get_borderRightStyle", "put_borderBottomStyle", "get_borderBottomStyle", "put_borderLeftStyle", "get_borderLeftStyle", "put_width", "get_width", "put_height", "get_height", "put_styleFloat", "get_styleFloat", "put_clear", "get_clear", "put_display", "get_display", "put_visibility", "get_visibility", "put_listStyleType", "get_listStyleType", "put_listStylePosition", "get_listStylePosition", "put_listStyleImage", "get_listStyleImage", "put_listStyle", "get_listStyle", "put_whiteSpace", "get_whiteSpace", "put_top", "get_top", "put_left", "get_left", "get_position", "put_zIndex", "get_zIndex", "put_overflow", "get_overflow", "put_pageBreakBefore", "get_pageBreakBefore", "put_pageBreakAfter", "get_pageBreakAfter", "put_cssText", "get_cssText", "put_pixelTop", "get_pixelTop", "put_pixelLeft", "get_pixelLeft", "put_pixelWidth", "get_pixelWidth", "put_pixelHeight", "get_pixelHeight", "put_posTop", "get_posTop", "put_posLeft", "get_posLeft", "put_posWidth", "get_posWidth", "put_posHeight", "get_posHeight", "put_cursor", "get_cursor", "put_clip", "get_clip", "put_filter", "get_filter", "setAttribute", "getAttribute", "removeAttribute", "toString"]

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontFamily(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontFamily() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontStyle() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontVariant(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontVariant() {
        p := BSTR()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontWeight(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontWeight() {
        p := BSTR()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_fontSize(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_fontSize() {
        p := VARIANT()
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_font(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_font() {
        p := BSTR()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_color(v) {
        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_color() {
        p := VARIANT()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_background(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_background() {
        p := BSTR()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_backgroundColor(v) {
        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_backgroundColor() {
        p := VARIANT()
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundImage(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundImage() {
        p := BSTR()
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundRepeat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundRepeat() {
        p := BSTR()
        result := ComCall(28, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundAttachment(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundAttachment() {
        p := BSTR()
        result := ComCall(30, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundPosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundPosition() {
        p := BSTR()
        result := ComCall(32, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_backgroundPositionX(v) {
        result := ComCall(33, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_backgroundPositionX() {
        p := VARIANT()
        result := ComCall(34, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_backgroundPositionY(v) {
        result := ComCall(35, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_backgroundPositionY() {
        p := VARIANT()
        result := ComCall(36, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_wordSpacing(v) {
        result := ComCall(37, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_wordSpacing() {
        p := VARIANT()
        result := ComCall(38, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_letterSpacing(v) {
        result := ComCall(39, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_letterSpacing() {
        p := VARIANT()
        result := ComCall(40, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textDecoration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(41, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textDecoration() {
        p := BSTR()
        result := ComCall(42, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_textDecorationNone(v) {
        result := ComCall(43, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_textDecorationNone() {
        result := ComCall(44, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_textDecorationUnderline(v) {
        result := ComCall(45, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_textDecorationUnderline() {
        result := ComCall(46, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_textDecorationOverline(v) {
        result := ComCall(47, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_textDecorationOverline() {
        result := ComCall(48, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_textDecorationLineThrough(v) {
        result := ComCall(49, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_textDecorationLineThrough() {
        result := ComCall(50, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_textDecorationBlink(v) {
        result := ComCall(51, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_textDecorationBlink() {
        result := ComCall(52, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_verticalAlign(v) {
        result := ComCall(53, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_verticalAlign() {
        p := VARIANT()
        result := ComCall(54, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textTransform(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(55, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textTransform() {
        p := BSTR()
        result := ComCall(56, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(57, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAlign() {
        p := BSTR()
        result := ComCall(58, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textIndent(v) {
        result := ComCall(59, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textIndent() {
        p := VARIANT()
        result := ComCall(60, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_lineHeight(v) {
        result := ComCall(61, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_lineHeight() {
        p := VARIANT()
        result := ComCall(62, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginTop(v) {
        result := ComCall(63, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginTop() {
        p := VARIANT()
        result := ComCall(64, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginRight(v) {
        result := ComCall(65, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginRight() {
        p := VARIANT()
        result := ComCall(66, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginBottom(v) {
        result := ComCall(67, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginBottom() {
        p := VARIANT()
        result := ComCall(68, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginLeft(v) {
        result := ComCall(69, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginLeft() {
        p := VARIANT()
        result := ComCall(70, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_margin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(71, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_margin() {
        p := BSTR()
        result := ComCall(72, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_paddingTop(v) {
        result := ComCall(73, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingTop() {
        p := VARIANT()
        result := ComCall(74, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_paddingRight(v) {
        result := ComCall(75, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingRight() {
        p := VARIANT()
        result := ComCall(76, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_paddingBottom(v) {
        result := ComCall(77, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingBottom() {
        p := VARIANT()
        result := ComCall(78, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_paddingLeft(v) {
        result := ComCall(79, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingLeft() {
        p := VARIANT()
        result := ComCall(80, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_padding(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(81, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_padding() {
        p := BSTR()
        result := ComCall(82, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_border(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(83, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_border() {
        p := BSTR()
        result := ComCall(84, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderTop(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(85, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderTop() {
        p := BSTR()
        result := ComCall(86, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderRight(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(87, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderRight() {
        p := BSTR()
        result := ComCall(88, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderBottom(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(89, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderBottom() {
        p := BSTR()
        result := ComCall(90, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderLeft(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(91, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderLeft() {
        p := BSTR()
        result := ComCall(92, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderColor(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(93, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderColor() {
        p := BSTR()
        result := ComCall(94, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderTopColor(v) {
        result := ComCall(95, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderTopColor() {
        p := VARIANT()
        result := ComCall(96, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderRightColor(v) {
        result := ComCall(97, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderRightColor() {
        p := VARIANT()
        result := ComCall(98, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderBottomColor(v) {
        result := ComCall(99, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderBottomColor() {
        p := VARIANT()
        result := ComCall(100, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderLeftColor(v) {
        result := ComCall(101, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderLeftColor() {
        p := VARIANT()
        result := ComCall(102, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderWidth(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(103, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderWidth() {
        p := BSTR()
        result := ComCall(104, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderTopWidth(v) {
        result := ComCall(105, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderTopWidth() {
        p := VARIANT()
        result := ComCall(106, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderRightWidth(v) {
        result := ComCall(107, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderRightWidth() {
        p := VARIANT()
        result := ComCall(108, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderBottomWidth(v) {
        result := ComCall(109, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderBottomWidth() {
        p := VARIANT()
        result := ComCall(110, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderLeftWidth(v) {
        result := ComCall(111, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderLeftWidth() {
        p := VARIANT()
        result := ComCall(112, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(113, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderStyle() {
        p := BSTR()
        result := ComCall(114, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderTopStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(115, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderTopStyle() {
        p := BSTR()
        result := ComCall(116, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderRightStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(117, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderRightStyle() {
        p := BSTR()
        result := ComCall(118, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderBottomStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(119, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderBottomStyle() {
        p := BSTR()
        result := ComCall(120, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderLeftStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(121, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderLeftStyle() {
        p := BSTR()
        result := ComCall(122, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(123, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_width() {
        p := VARIANT()
        result := ComCall(124, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(125, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_height() {
        p := VARIANT()
        result := ComCall(126, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_styleFloat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(127, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_styleFloat() {
        p := BSTR()
        result := ComCall(128, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_clear(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(129, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_clear() {
        p := BSTR()
        result := ComCall(130, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_display(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(131, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_display() {
        p := BSTR()
        result := ComCall(132, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_visibility(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(133, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_visibility() {
        p := BSTR()
        result := ComCall(134, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_listStyleType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(135, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStyleType() {
        p := BSTR()
        result := ComCall(136, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_listStylePosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(137, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStylePosition() {
        p := BSTR()
        result := ComCall(138, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_listStyleImage(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(139, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStyleImage() {
        p := BSTR()
        result := ComCall(140, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_listStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(141, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStyle() {
        p := BSTR()
        result := ComCall(142, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_whiteSpace(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(143, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_whiteSpace() {
        p := BSTR()
        result := ComCall(144, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_top(v) {
        result := ComCall(145, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_top() {
        p := VARIANT()
        result := ComCall(146, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_left(v) {
        result := ComCall(147, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_left() {
        p := VARIANT()
        result := ComCall(148, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_position() {
        p := BSTR()
        result := ComCall(149, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_zIndex(v) {
        result := ComCall(150, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_zIndex() {
        p := VARIANT()
        result := ComCall(151, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_overflow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(152, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_overflow() {
        p := BSTR()
        result := ComCall(153, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pageBreakBefore(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(154, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pageBreakBefore() {
        p := BSTR()
        result := ComCall(155, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pageBreakAfter(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(156, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pageBreakAfter() {
        p := BSTR()
        result := ComCall(157, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cssText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(158, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cssText() {
        p := BSTR()
        result := ComCall(159, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pixelTop(v) {
        result := ComCall(160, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pixelTop() {
        result := ComCall(161, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pixelLeft(v) {
        result := ComCall(162, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pixelLeft() {
        result := ComCall(163, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pixelWidth(v) {
        result := ComCall(164, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pixelWidth() {
        result := ComCall(165, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pixelHeight(v) {
        result := ComCall(166, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pixelHeight() {
        result := ComCall(167, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_posTop(v) {
        result := ComCall(168, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_posTop() {
        result := ComCall(169, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_posLeft(v) {
        result := ComCall(170, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_posLeft() {
        result := ComCall(171, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_posWidth(v) {
        result := ComCall(172, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_posWidth() {
        result := ComCall(173, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_posHeight(v) {
        result := ComCall(174, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_posHeight() {
        result := ComCall(175, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cursor(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(176, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cursor() {
        p := BSTR()
        result := ComCall(177, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_clip(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(178, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_clip() {
        p := BSTR()
        result := ComCall(179, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_filter(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(180, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_filter() {
        p := BSTR()
        result := ComCall(181, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @param {VARIANT} AttributeValue 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    setAttribute(strAttributeName, AttributeValue, lFlags) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(182, this, "ptr", strAttributeName, "ptr", AttributeValue, "int", lFlags, "HRESULT")
        return result
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
        result := ComCall(183, this, "ptr", strAttributeName, "int", lFlags, "ptr", AttributeValue, "HRESULT")
        return AttributeValue
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @param {Integer} lFlags 
     * @returns {VARIANT_BOOL} 
     */
    removeAttribute(strAttributeName, lFlags) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(184, this, "ptr", strAttributeName, "int", lFlags, "short*", &pfSuccess := 0, "HRESULT")
        return pfSuccess
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        String := BSTR()
        result := ComCall(185, this, "ptr", String, "HRESULT")
        return String
    }
}
