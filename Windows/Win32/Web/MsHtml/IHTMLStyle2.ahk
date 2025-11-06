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
class IHTMLStyle2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLStyle2
     * @type {Guid}
     */
    static IID => Guid("{3050f4a2-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_tableLayout", "get_tableLayout", "put_borderCollapse", "get_borderCollapse", "put_direction", "get_direction", "put_behavior", "get_behavior", "setExpression", "getExpression", "removeExpression", "put_position", "get_position", "put_unicodeBidi", "get_unicodeBidi", "put_bottom", "get_bottom", "put_right", "get_right", "put_pixelBottom", "get_pixelBottom", "put_pixelRight", "get_pixelRight", "put_posBottom", "get_posBottom", "put_posRight", "get_posRight", "put_imeMode", "get_imeMode", "put_rubyAlign", "get_rubyAlign", "put_rubyPosition", "get_rubyPosition", "put_rubyOverhang", "get_rubyOverhang", "put_layoutGridChar", "get_layoutGridChar", "put_layoutGridLine", "get_layoutGridLine", "put_layoutGridMode", "get_layoutGridMode", "put_layoutGridType", "get_layoutGridType", "put_layoutGrid", "get_layoutGrid", "put_wordBreak", "get_wordBreak", "put_lineBreak", "get_lineBreak", "put_textJustify", "get_textJustify", "put_textJustifyTrim", "get_textJustifyTrim", "put_textKashida", "get_textKashida", "put_textAutospace", "get_textAutospace", "put_overflowX", "get_overflowX", "put_overflowY", "get_overflowY", "put_accelerator", "get_accelerator"]

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_tableLayout(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_tableLayout() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderCollapse(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderCollapse() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_direction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_direction() {
        p := BSTR()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_behavior(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_behavior() {
        p := BSTR()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} propname 
     * @param {BSTR} expression 
     * @param {BSTR} language 
     * @returns {HRESULT} 
     */
    setExpression(propname, expression, language) {
        propname := propname is String ? BSTR.Alloc(propname).Value : propname
        expression := expression is String ? BSTR.Alloc(expression).Value : expression
        language := language is String ? BSTR.Alloc(language).Value : language

        result := ComCall(15, this, "ptr", propname, "ptr", expression, "ptr", language, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} propname 
     * @returns {VARIANT} 
     */
    getExpression(propname) {
        propname := propname is String ? BSTR.Alloc(propname).Value : propname

        expression := VARIANT()
        result := ComCall(16, this, "ptr", propname, "ptr", expression, "HRESULT")
        return expression
    }

    /**
     * 
     * @param {BSTR} propname 
     * @returns {VARIANT_BOOL} 
     */
    removeExpression(propname) {
        propname := propname is String ? BSTR.Alloc(propname).Value : propname

        result := ComCall(17, this, "ptr", propname, "short*", &pfSuccess := 0, "HRESULT")
        return pfSuccess
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_position(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(18, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_position() {
        p := BSTR()
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_unicodeBidi(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(20, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_unicodeBidi() {
        p := BSTR()
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_bottom(v) {
        result := ComCall(22, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_bottom() {
        p := VARIANT()
        result := ComCall(23, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_right(v) {
        result := ComCall(24, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_right() {
        p := VARIANT()
        result := ComCall(25, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pixelBottom(v) {
        result := ComCall(26, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pixelBottom() {
        result := ComCall(27, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pixelRight(v) {
        result := ComCall(28, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pixelRight() {
        result := ComCall(29, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_posBottom(v) {
        result := ComCall(30, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_posBottom() {
        result := ComCall(31, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_posRight(v) {
        result := ComCall(32, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_posRight() {
        result := ComCall(33, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_imeMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(34, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_imeMode() {
        p := BSTR()
        result := ComCall(35, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_rubyAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(36, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rubyAlign() {
        p := BSTR()
        result := ComCall(37, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_rubyPosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(38, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rubyPosition() {
        p := BSTR()
        result := ComCall(39, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_rubyOverhang(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(40, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rubyOverhang() {
        p := BSTR()
        result := ComCall(41, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_layoutGridChar(v) {
        result := ComCall(42, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_layoutGridChar() {
        p := VARIANT()
        result := ComCall(43, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_layoutGridLine(v) {
        result := ComCall(44, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_layoutGridLine() {
        p := VARIANT()
        result := ComCall(45, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_layoutGridMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(46, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_layoutGridMode() {
        p := BSTR()
        result := ComCall(47, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_layoutGridType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(48, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_layoutGridType() {
        p := BSTR()
        result := ComCall(49, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_layoutGrid(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(50, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_layoutGrid() {
        p := BSTR()
        result := ComCall(51, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_wordBreak(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(52, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_wordBreak() {
        p := BSTR()
        result := ComCall(53, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_lineBreak(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(54, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_lineBreak() {
        p := BSTR()
        result := ComCall(55, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textJustify(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(56, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textJustify() {
        p := BSTR()
        result := ComCall(57, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textJustifyTrim(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(58, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textJustifyTrim() {
        p := BSTR()
        result := ComCall(59, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textKashida(v) {
        result := ComCall(60, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textKashida() {
        p := VARIANT()
        result := ComCall(61, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textAutospace(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(62, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAutospace() {
        p := BSTR()
        result := ComCall(63, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_overflowX(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(64, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_overflowX() {
        p := BSTR()
        result := ComCall(65, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_overflowY(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(66, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_overflowY() {
        p := BSTR()
        result := ComCall(67, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_accelerator(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(68, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_accelerator() {
        p := BSTR()
        result := ComCall(69, this, "ptr", p, "HRESULT")
        return p
    }
}
