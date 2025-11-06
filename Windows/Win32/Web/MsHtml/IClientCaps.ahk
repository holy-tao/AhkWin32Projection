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
     * @returns {VARIANT_BOOL} 
     */
    get_javaEnabled() {
        result := ComCall(7, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_cookieEnabled() {
        result := ComCall(8, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cpuClass() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_systemLanguage() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_userLanguage() {
        p := BSTR()
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_platform() {
        p := BSTR()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_connectionSpeed() {
        result := ComCall(13, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_onLine() {
        result := ComCall(14, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_colorDepth() {
        result := ComCall(15, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_bufferDepth() {
        result := ComCall(16, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_width() {
        result := ComCall(17, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_height() {
        result := ComCall(18, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_availHeight() {
        result := ComCall(19, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_availWidth() {
        result := ComCall(20, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_connectionType() {
        p := BSTR()
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrUrl 
     * @param {BSTR} bStrVer 
     * @returns {VARIANT_BOOL} 
     */
    isComponentInstalled(bstrName, bstrUrl, bStrVer) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl
        bStrVer := bStrVer is String ? BSTR.Alloc(bStrVer).Value : bStrVer

        result := ComCall(22, this, "ptr", bstrName, "ptr", bstrUrl, "ptr", bStrVer, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrUrl 
     * @returns {BSTR} 
     */
    getComponentVersion(bstrName, bstrUrl) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        pbstrVer := BSTR()
        result := ComCall(23, this, "ptr", bstrName, "ptr", bstrUrl, "ptr", pbstrVer, "HRESULT")
        return pbstrVer
    }

    /**
     * 
     * @param {BSTR} bstrVer1 
     * @param {BSTR} bstrVer2 
     * @returns {Integer} 
     */
    compareVersions(bstrVer1, bstrVer2) {
        bstrVer1 := bstrVer1 is String ? BSTR.Alloc(bstrVer1).Value : bstrVer1
        bstrVer2 := bstrVer2 is String ? BSTR.Alloc(bstrVer2).Value : bstrVer2

        result := ComCall(24, this, "ptr", bstrVer1, "ptr", bstrVer2, "int*", &p := 0, "HRESULT")
        return p
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
     * @returns {VARIANT_BOOL} 
     */
    doComponentRequest() {
        result := ComCall(26, this, "short*", &p := 0, "HRESULT")
        return p
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
