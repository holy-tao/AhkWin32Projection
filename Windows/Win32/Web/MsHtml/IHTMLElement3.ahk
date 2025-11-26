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
class IHTMLElement3 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLElement3
     * @type {Guid}
     */
    static IID => Guid("{3050f673-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["mergeAttributes", "get_isMultiLine", "get_canHaveHTML", "put_onlayoutcomplete", "get_onlayoutcomplete", "put_onpage", "get_onpage", "put_inflateBlock", "get_inflateBlock", "put_onbeforedeactivate", "get_onbeforedeactivate", "setActive", "put_contentEditable", "get_contentEditable", "get_isContentEditable", "put_hideFocus", "get_hideFocus", "put_disabled", "get_disabled", "get_isDisabled", "put_onmove", "get_onmove", "put_oncontrolselect", "get_oncontrolselect", "fireEvent", "put_onresizestart", "get_onresizestart", "put_onresizeend", "get_onresizeend", "put_onmovestart", "get_onmovestart", "put_onmoveend", "get_onmoveend", "put_onmouseenter", "get_onmouseenter", "put_onmouseleave", "get_onmouseleave", "put_onactivate", "get_onactivate", "put_ondeactivate", "get_ondeactivate", "dragDrop", "get_glyphMode"]

    /**
     * @type {VARIANT_BOOL} 
     */
    isMultiLine {
        get => this.get_isMultiLine()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    canHaveHTML {
        get => this.get_canHaveHTML()
    }

    /**
     * @type {VARIANT} 
     */
    onlayoutcomplete {
        get => this.get_onlayoutcomplete()
        set => this.put_onlayoutcomplete(value)
    }

    /**
     * @type {VARIANT} 
     */
    onpage {
        get => this.get_onpage()
        set => this.put_onpage(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    inflateBlock {
        get => this.get_inflateBlock()
        set => this.put_inflateBlock(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforedeactivate {
        get => this.get_onbeforedeactivate()
        set => this.put_onbeforedeactivate(value)
    }

    /**
     * @type {BSTR} 
     */
    contentEditable {
        get => this.get_contentEditable()
        set => this.put_contentEditable(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isContentEditable {
        get => this.get_isContentEditable()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    hideFocus {
        get => this.get_hideFocus()
        set => this.put_hideFocus(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    disabled {
        get => this.get_disabled()
        set => this.put_disabled(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isDisabled {
        get => this.get_isDisabled()
    }

    /**
     * @type {VARIANT} 
     */
    onmove {
        get => this.get_onmove()
        set => this.put_onmove(value)
    }

    /**
     * @type {VARIANT} 
     */
    oncontrolselect {
        get => this.get_oncontrolselect()
        set => this.put_oncontrolselect(value)
    }

    /**
     * @type {VARIANT} 
     */
    onresizestart {
        get => this.get_onresizestart()
        set => this.put_onresizestart(value)
    }

    /**
     * @type {VARIANT} 
     */
    onresizeend {
        get => this.get_onresizeend()
        set => this.put_onresizeend(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmovestart {
        get => this.get_onmovestart()
        set => this.put_onmovestart(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmoveend {
        get => this.get_onmoveend()
        set => this.put_onmoveend(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmouseenter {
        get => this.get_onmouseenter()
        set => this.put_onmouseenter(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmouseleave {
        get => this.get_onmouseleave()
        set => this.put_onmouseleave(value)
    }

    /**
     * @type {VARIANT} 
     */
    onactivate {
        get => this.get_onactivate()
        set => this.put_onactivate(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondeactivate {
        get => this.get_ondeactivate()
        set => this.put_ondeactivate(value)
    }

    /**
     * @type {Integer} 
     */
    glyphMode {
        get => this.get_glyphMode()
    }

    /**
     * 
     * @param {IHTMLElement} mergeThis 
     * @param {Pointer<VARIANT>} pvarFlags 
     * @returns {HRESULT} 
     */
    mergeAttributes(mergeThis, pvarFlags) {
        result := ComCall(7, this, "ptr", mergeThis, "ptr", pvarFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isMultiLine() {
        result := ComCall(8, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_canHaveHTML() {
        result := ComCall(9, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onlayoutcomplete(v) {
        result := ComCall(10, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onlayoutcomplete() {
        p := VARIANT()
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onpage(v) {
        result := ComCall(12, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onpage() {
        p := VARIANT()
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_inflateBlock(v) {
        result := ComCall(14, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_inflateBlock() {
        result := ComCall(15, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforedeactivate(v) {
        result := ComCall(16, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforedeactivate() {
        p := VARIANT()
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    setActive() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_contentEditable(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_contentEditable() {
        p := BSTR()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isContentEditable() {
        result := ComCall(21, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_hideFocus(v) {
        result := ComCall(22, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_hideFocus() {
        result := ComCall(23, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_disabled(v) {
        result := ComCall(24, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_disabled() {
        result := ComCall(25, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isDisabled() {
        result := ComCall(26, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmove(v) {
        result := ComCall(27, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmove() {
        p := VARIANT()
        result := ComCall(28, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncontrolselect(v) {
        result := ComCall(29, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncontrolselect() {
        p := VARIANT()
        result := ComCall(30, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrEventName 
     * @param {Pointer<VARIANT>} pvarEventObject 
     * @returns {VARIANT_BOOL} 
     */
    fireEvent(bstrEventName, pvarEventObject) {
        bstrEventName := bstrEventName is String ? BSTR.Alloc(bstrEventName).Value : bstrEventName

        result := ComCall(31, this, "ptr", bstrEventName, "ptr", pvarEventObject, "short*", &pfCancelled := 0, "HRESULT")
        return pfCancelled
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onresizestart(v) {
        result := ComCall(32, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onresizestart() {
        p := VARIANT()
        result := ComCall(33, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onresizeend(v) {
        result := ComCall(34, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onresizeend() {
        p := VARIANT()
        result := ComCall(35, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmovestart(v) {
        result := ComCall(36, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmovestart() {
        p := VARIANT()
        result := ComCall(37, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmoveend(v) {
        result := ComCall(38, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmoveend() {
        p := VARIANT()
        result := ComCall(39, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseenter(v) {
        result := ComCall(40, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseenter() {
        p := VARIANT()
        result := ComCall(41, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseleave(v) {
        result := ComCall(42, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseleave() {
        p := VARIANT()
        result := ComCall(43, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onactivate(v) {
        result := ComCall(44, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onactivate() {
        p := VARIANT()
        result := ComCall(45, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondeactivate(v) {
        result := ComCall(46, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondeactivate() {
        p := VARIANT()
        result := ComCall(47, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    dragDrop() {
        result := ComCall(48, this, "short*", &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_glyphMode() {
        result := ComCall(49, this, "int*", &p := 0, "HRESULT")
        return p
    }
}
