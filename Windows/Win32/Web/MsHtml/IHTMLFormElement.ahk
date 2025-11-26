#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLFormElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLFormElement
     * @type {Guid}
     */
    static IID => Guid("{3050f1f7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLFormElement
     * @type {Guid}
     */
    static CLSID => Guid("{3050f251-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_action", "get_action", "put_dir", "get_dir", "put_encoding", "get_encoding", "put_method", "get_method", "get_elements", "put_target", "get_target", "put_name", "get_name", "put_onsubmit", "get_onsubmit", "put_onreset", "get_onreset", "submit", "reset", "put_length", "get_length", "get__newEnum", "item", "tags"]

    /**
     * @type {BSTR} 
     */
    action {
        get => this.get_action()
        set => this.put_action(value)
    }

    /**
     * @type {BSTR} 
     */
    dir {
        get => this.get_dir()
        set => this.put_dir(value)
    }

    /**
     * @type {BSTR} 
     */
    encoding {
        get => this.get_encoding()
        set => this.put_encoding(value)
    }

    /**
     * @type {BSTR} 
     */
    method {
        get => this.get_method()
        set => this.put_method(value)
    }

    /**
     * @type {IDispatch} 
     */
    elements {
        get => this.get_elements()
    }

    /**
     * @type {BSTR} 
     */
    target {
        get => this.get_target()
        set => this.put_target(value)
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
        set => this.put_name(value)
    }

    /**
     * @type {VARIANT} 
     */
    onsubmit {
        get => this.get_onsubmit()
        set => this.put_onsubmit(value)
    }

    /**
     * @type {VARIANT} 
     */
    onreset {
        get => this.get_onreset()
        set => this.put_onreset(value)
    }

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
        set => this.put_length(value)
    }

    /**
     * @type {IUnknown} 
     */
    _newEnum {
        get => this.get__newEnum()
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_action(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_action() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dir(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dir() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_encoding(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_encoding() {
        p := BSTR()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_method(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_method() {
        p := BSTR()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_elements() {
        result := ComCall(15, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_target(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(16, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_target() {
        p := BSTR()
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(18, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR()
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onsubmit(v) {
        result := ComCall(20, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onsubmit() {
        p := VARIANT()
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreset(v) {
        result := ComCall(22, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreset() {
        p := VARIANT()
        result := ComCall(23, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    submit() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    reset() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_length(v) {
        result := ComCall(26, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(27, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(28, this, "ptr*", &p := 0, "HRESULT")
        return IUnknown(p)
    }

    /**
     * 
     * @param {VARIANT} name 
     * @param {VARIANT} index 
     * @returns {IDispatch} 
     */
    item(name, index) {
        result := ComCall(29, this, "ptr", name, "ptr", index, "ptr*", &pdisp := 0, "HRESULT")
        return IDispatch(pdisp)
    }

    /**
     * 
     * @param {VARIANT} tagName 
     * @returns {IDispatch} 
     */
    tags(tagName) {
        result := ComCall(30, this, "ptr", tagName, "ptr*", &pdisp := 0, "HRESULT")
        return IDispatch(pdisp)
    }
}
