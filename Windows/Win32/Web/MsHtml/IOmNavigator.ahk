#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IOmNavigator extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOmNavigator
     * @type {Guid}
     */
    static IID => Guid("{feceaaa5-8405-11cf-8ba1-00aa00476da6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_appCodeName", "get_appName", "get_appVersion", "get_userAgent", "javaEnabled", "taintEnabled", "get_mimeTypes", "get_plugins", "get_cookieEnabled", "get_opsProfile", "toString", "get_cpuClass", "get_systemLanguage", "get_browserLanguage", "get_userLanguage", "get_platform", "get_appMinorVersion", "get_connectionSpeed", "get_onLine", "get_userProfile"]

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_appCodeName(p) {
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_appName(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_appVersion(p) {
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_userAgent(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     */
    javaEnabled(enabled) {
        result := ComCall(11, this, "ptr", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     */
    taintEnabled(enabled) {
        result := ComCall(12, this, "ptr", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLMimeTypesCollection>} p 
     * @returns {HRESULT} 
     */
    get_mimeTypes(p) {
        result := ComCall(13, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLPluginsCollection>} p 
     * @returns {HRESULT} 
     */
    get_plugins(p) {
        result := ComCall(14, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_cookieEnabled(p) {
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLOpsProfile>} p 
     * @returns {HRESULT} 
     */
    get_opsProfile(p) {
        result := ComCall(16, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} string 
     * @returns {HRESULT} 
     */
    toString(string) {
        result := ComCall(17, this, "ptr", string, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_cpuClass(p) {
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_systemLanguage(p) {
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_browserLanguage(p) {
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_userLanguage(p) {
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_platform(p) {
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_appMinorVersion(p) {
        result := ComCall(23, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_connectionSpeed(p) {
        result := ComCall(24, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_onLine(p) {
        result := ComCall(25, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLOpsProfile>} p 
     * @returns {HRESULT} 
     */
    get_userProfile(p) {
        result := ComCall(26, this, "ptr*", p, "HRESULT")
        return result
    }
}
