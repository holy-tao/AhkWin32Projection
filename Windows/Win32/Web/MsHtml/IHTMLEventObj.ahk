#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLElement.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {IHTMLElement} 
     */
    get_srcElement() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_altKey() {
        result := ComCall(8, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ctrlKey() {
        result := ComCall(9, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_shiftKey() {
        result := ComCall(10, this, "short*", &p := 0, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_returnValue() {
        p := VARIANT()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT_BOOL} 
     */
    get_cancelBubble() {
        result := ComCall(14, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_fromElement() {
        result := ComCall(15, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_toElement() {
        result := ComCall(16, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
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
     * @returns {Integer} 
     */
    get_keyCode() {
        result := ComCall(18, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_button() {
        result := ComCall(19, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_qualifier() {
        p := BSTR()
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_reason() {
        result := ComCall(22, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_x() {
        result := ComCall(23, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_y() {
        result := ComCall(24, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientX() {
        result := ComCall(25, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientY() {
        result := ComCall(26, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_offsetX() {
        result := ComCall(27, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_offsetY() {
        result := ComCall(28, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_screenX() {
        result := ComCall(29, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_screenY() {
        result := ComCall(30, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_srcFilter() {
        result := ComCall(31, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }
}
