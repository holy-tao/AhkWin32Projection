#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLEventObj extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLEventObj
     * @type {Guid}
     */
    static IID => Guid("{3050f32d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_srcElement", "get_altKey", "get_ctrlKey", "get_shiftKey", "put_returnValue", "get_returnValue", "put_cancelBubble", "get_cancelBubble", "get_fromElement", "get_toElement", "put_keyCode", "get_keyCode", "get_button", "get_type", "get_qualifier", "get_reason", "get_x", "get_y", "get_clientX", "get_clientY", "get_offsetX", "get_offsetY", "get_screenX", "get_screenY", "get_srcFilter"]

    /**
     * 
     * @param {Pointer<IHTMLElement>} p 
     * @returns {HRESULT} 
     */
    get_srcElement(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_altKey(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_ctrlKey(p) {
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_shiftKey(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_returnValue(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_returnValue(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_cancelBubble(v) {
        result := ComCall(13, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_cancelBubble(p) {
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} p 
     * @returns {HRESULT} 
     */
    get_fromElement(p) {
        result := ComCall(15, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} p 
     * @returns {HRESULT} 
     */
    get_toElement(p) {
        result := ComCall(16, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_keyCode(v) {
        result := ComCall(17, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_keyCode(p) {
        result := ComCall(18, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_button(p) {
        result := ComCall(19, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_type(p) {
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_qualifier(p) {
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_reason(p) {
        result := ComCall(22, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_x(p) {
        result := ComCall(23, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_y(p) {
        result := ComCall(24, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_clientX(p) {
        result := ComCall(25, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_clientY(p) {
        result := ComCall(26, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_offsetX(p) {
        result := ComCall(27, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_offsetY(p) {
        result := ComCall(28, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_screenX(p) {
        result := ComCall(29, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_screenY(p) {
        result := ComCall(30, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_srcFilter(p) {
        result := ComCall(31, this, "ptr*", p, "HRESULT")
        return result
    }
}
