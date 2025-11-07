#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLFormElement.ahk
#Include .\IHTMLTxtRange.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLInputHiddenElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLInputHiddenElement
     * @type {Guid}
     */
    static IID => Guid("{3050f2a4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_type", "put_value", "get_value", "put_name", "get_name", "put_status", "get_status", "put_disabled", "get_disabled", "get_form", "createTextRange"]

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
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(8, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_value() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(10, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR()
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_status(v) {
        result := ComCall(12, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_status() {
        p := VARIANT()
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_disabled(v) {
        result := ComCall(14, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_disabled() {
        result := ComCall(15, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLFormElement} 
     */
    get_form() {
        result := ComCall(16, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFormElement(p)
    }

    /**
     * 
     * @returns {IHTMLTxtRange} 
     */
    createTextRange() {
        result := ComCall(17, this, "ptr*", &range := 0, "HRESULT")
        return IHTMLTxtRange(range)
    }
}
