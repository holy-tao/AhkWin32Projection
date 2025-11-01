#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLOpsProfile extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLOpsProfile
     * @type {Guid}
     */
    static IID => Guid("{3050f401-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["addRequest", "clearRequest", "doRequest", "getAttribute", "setAttribute", "commitChanges", "addReadRequest", "doReadRequest", "doWriteRequest"]

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} reserved 
     * @param {Pointer<VARIANT_BOOL>} success 
     * @returns {HRESULT} 
     */
    addRequest(name, reserved, success) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(7, this, "ptr", name, "ptr", reserved, "ptr", success, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    clearRequest() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} usage 
     * @param {VARIANT} fname 
     * @param {VARIANT} domain 
     * @param {VARIANT} path 
     * @param {VARIANT} expire 
     * @param {VARIANT} reserved 
     * @returns {HRESULT} 
     */
    doRequest(usage, fname, domain, path, expire, reserved) {
        result := ComCall(9, this, "ptr", usage, "ptr", fname, "ptr", domain, "ptr", path, "ptr", expire, "ptr", reserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     */
    getAttribute(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, "ptr", name, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} value 
     * @param {VARIANT} prefs 
     * @param {Pointer<VARIANT_BOOL>} success 
     * @returns {HRESULT} 
     */
    setAttribute(name, value, prefs, success) {
        name := name is String ? BSTR.Alloc(name).Value : name
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(11, this, "ptr", name, "ptr", value, "ptr", prefs, "ptr", success, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} success 
     * @returns {HRESULT} 
     */
    commitChanges(success) {
        result := ComCall(12, this, "ptr", success, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} reserved 
     * @param {Pointer<VARIANT_BOOL>} success 
     * @returns {HRESULT} 
     */
    addReadRequest(name, reserved, success) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, "ptr", name, "ptr", reserved, "ptr", success, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} usage 
     * @param {VARIANT} fname 
     * @param {VARIANT} domain 
     * @param {VARIANT} path 
     * @param {VARIANT} expire 
     * @param {VARIANT} reserved 
     * @returns {HRESULT} 
     */
    doReadRequest(usage, fname, domain, path, expire, reserved) {
        result := ComCall(14, this, "ptr", usage, "ptr", fname, "ptr", domain, "ptr", path, "ptr", expire, "ptr", reserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} success 
     * @returns {HRESULT} 
     */
    doWriteRequest(success) {
        result := ComCall(15, this, "ptr", success, "HRESULT")
        return result
    }
}
