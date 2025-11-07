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
class IHTMLInputImage extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLInputImage
     * @type {Guid}
     */
    static IID => Guid("{3050f2c2-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLInputImage
     * @type {Guid}
     */
    static CLSID => Guid("{3050f2c4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_type", "put_disabled", "get_disabled", "put_border", "get_border", "put_vspace", "get_vspace", "put_hspace", "get_hspace", "put_alt", "get_alt", "put_src", "get_src", "put_lowsrc", "get_lowsrc", "put_vrml", "get_vrml", "put_dynsrc", "get_dynsrc", "get_readyState", "get_complete", "put_loop", "get_loop", "put_align", "get_align", "put_onload", "get_onload", "put_onerror", "get_onerror", "put_onabort", "get_onabort", "put_name", "get_name", "put_width", "get_width", "put_height", "get_height", "put_start", "get_start"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_disabled(v) {
        result := ComCall(8, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_disabled() {
        result := ComCall(9, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_border(v) {
        result := ComCall(10, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_border() {
        p := VARIANT()
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_vspace(v) {
        result := ComCall(12, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_vspace() {
        result := ComCall(13, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_hspace(v) {
        result := ComCall(14, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_hspace() {
        result := ComCall(15, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_alt(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(16, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_alt() {
        p := BSTR()
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_src(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(18, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_src() {
        p := BSTR()
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_lowsrc(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(20, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_lowsrc() {
        p := BSTR()
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_vrml(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(22, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_vrml() {
        p := BSTR()
        result := ComCall(23, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dynsrc(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(24, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dynsrc() {
        p := BSTR()
        result := ComCall(25, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_readyState() {
        p := BSTR()
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_complete() {
        result := ComCall(27, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_loop(v) {
        result := ComCall(28, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_loop() {
        p := VARIANT()
        result := ComCall(29, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_align(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(30, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_align() {
        p := BSTR()
        result := ComCall(31, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onload(v) {
        result := ComCall(32, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onload() {
        p := VARIANT()
        result := ComCall(33, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerror(v) {
        result := ComCall(34, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerror() {
        p := VARIANT()
        result := ComCall(35, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onabort(v) {
        result := ComCall(36, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onabort() {
        p := VARIANT()
        result := ComCall(37, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(38, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR()
        result := ComCall(39, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(40, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_width() {
        result := ComCall(41, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(42, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_height() {
        result := ComCall(43, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_start(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(44, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_start() {
        p := BSTR()
        result := ComCall(45, this, "ptr", p, "HRESULT")
        return p
    }
}
