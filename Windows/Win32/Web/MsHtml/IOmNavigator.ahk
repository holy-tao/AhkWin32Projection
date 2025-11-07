#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLMimeTypesCollection.ahk
#Include .\IHTMLPluginsCollection.ahk
#Include .\IHTMLOpsProfile.ahk
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
     * @returns {BSTR} 
     */
    get_appCodeName() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_appName() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_appVersion() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_userAgent() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    javaEnabled() {
        result := ComCall(11, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    taintEnabled() {
        result := ComCall(12, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * 
     * @returns {IHTMLMimeTypesCollection} 
     */
    get_mimeTypes() {
        result := ComCall(13, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLMimeTypesCollection(p)
    }

    /**
     * 
     * @returns {IHTMLPluginsCollection} 
     */
    get_plugins() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLPluginsCollection(p)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_cookieEnabled() {
        result := ComCall(15, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLOpsProfile} 
     */
    get_opsProfile() {
        result := ComCall(16, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLOpsProfile(p)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        string := BSTR()
        result := ComCall(17, this, "ptr", string, "HRESULT")
        return string
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cpuClass() {
        p := BSTR()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_systemLanguage() {
        p := BSTR()
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_browserLanguage() {
        p := BSTR()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_userLanguage() {
        p := BSTR()
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_platform() {
        p := BSTR()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_appMinorVersion() {
        p := BSTR()
        result := ComCall(23, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_connectionSpeed() {
        result := ComCall(24, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_onLine() {
        result := ComCall(25, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLOpsProfile} 
     */
    get_userProfile() {
        result := ComCall(26, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLOpsProfile(p)
    }
}
