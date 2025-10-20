#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IClientCaps extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClientCaps
     * @type {Guid}
     */
    static IID => Guid("{7e8bc44d-aeff-11d1-89c2-00c04fb6bfc4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_javaEnabled", "get_cookieEnabled", "get_cpuClass", "get_systemLanguage", "get_userLanguage", "get_platform", "get_connectionSpeed", "get_onLine", "get_colorDepth", "get_bufferDepth", "get_width", "get_height", "get_availHeight", "get_availWidth", "get_connectionType", "isComponentInstalled", "getComponentVersion", "compareVersions", "addComponentRequest", "doComponentRequest", "clearComponentRequest"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_javaEnabled(p) {
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_cookieEnabled(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_cpuClass(p) {
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_systemLanguage(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_userLanguage(p) {
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_platform(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_connectionSpeed(p) {
        result := ComCall(13, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_onLine(p) {
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_colorDepth(p) {
        result := ComCall(15, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_bufferDepth(p) {
        result := ComCall(16, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_width(p) {
        result := ComCall(17, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_height(p) {
        result := ComCall(18, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_availHeight(p) {
        result := ComCall(19, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_availWidth(p) {
        result := ComCall(20, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_connectionType(p) {
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrUrl 
     * @param {BSTR} bStrVer 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    isComponentInstalled(bstrName, bstrUrl, bStrVer, p) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl
        bStrVer := bStrVer is String ? BSTR.Alloc(bStrVer).Value : bStrVer

        result := ComCall(22, this, "ptr", bstrName, "ptr", bstrUrl, "ptr", bStrVer, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrUrl 
     * @param {Pointer<BSTR>} pbstrVer 
     * @returns {HRESULT} 
     */
    getComponentVersion(bstrName, bstrUrl, pbstrVer) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(23, this, "ptr", bstrName, "ptr", bstrUrl, "ptr", pbstrVer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrVer1 
     * @param {BSTR} bstrVer2 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    compareVersions(bstrVer1, bstrVer2, p) {
        bstrVer1 := bstrVer1 is String ? BSTR.Alloc(bstrVer1).Value : bstrVer1
        bstrVer2 := bstrVer2 is String ? BSTR.Alloc(bstrVer2).Value : bstrVer2

        result := ComCall(24, this, "ptr", bstrVer1, "ptr", bstrVer2, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrUrl 
     * @param {BSTR} bStrVer 
     * @returns {HRESULT} 
     */
    addComponentRequest(bstrName, bstrUrl, bStrVer) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl
        bStrVer := bStrVer is String ? BSTR.Alloc(bStrVer).Value : bStrVer

        result := ComCall(25, this, "ptr", bstrName, "ptr", bstrUrl, "ptr", bStrVer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    doComponentRequest(p) {
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    clearComponentRequest() {
        result := ComCall(27, this, "HRESULT")
        return result
    }
}
