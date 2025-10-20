#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_action(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_dir(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_encoding(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_method(p) {
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_elements(p) {
        result := ComCall(15, this, "ptr*", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_target(p) {
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_name(p) {
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onsubmit(p) {
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onreset(p) {
        result := ComCall(23, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        result := ComCall(27, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} p 
     * @returns {HRESULT} 
     */
    get__newEnum(p) {
        result := ComCall(28, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} name 
     * @param {VARIANT} index 
     * @param {Pointer<IDispatch>} pdisp 
     * @returns {HRESULT} 
     */
    item(name, index, pdisp) {
        result := ComCall(29, this, "ptr", name, "ptr", index, "ptr*", pdisp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} tagName 
     * @param {Pointer<IDispatch>} pdisp 
     * @returns {HRESULT} 
     */
    tags(tagName, pdisp) {
        result := ComCall(30, this, "ptr", tagName, "ptr*", pdisp, "HRESULT")
        return result
    }
}
