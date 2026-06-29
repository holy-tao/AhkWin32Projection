#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IHTMLPluginsCollection.ahk" { IHTMLPluginsCollection }
#Import ".\IHTMLMimeTypesCollection.ahk" { IHTMLMimeTypesCollection }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLOpsProfile.ahk" { IHTMLOpsProfile }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IOmNavigator extends IDispatch {
    /**
     * The interface identifier for IOmNavigator
     * @type {Guid}
     */
    static IID := Guid("{feceaaa5-8405-11cf-8ba1-00aa00476da6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOmNavigator interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_appCodeName     : IntPtr
        get_appName         : IntPtr
        get_appVersion      : IntPtr
        get_userAgent       : IntPtr
        javaEnabled         : IntPtr
        taintEnabled        : IntPtr
        get_mimeTypes       : IntPtr
        get_plugins         : IntPtr
        get_cookieEnabled   : IntPtr
        get_opsProfile      : IntPtr
        toString            : IntPtr
        get_cpuClass        : IntPtr
        get_systemLanguage  : IntPtr
        get_browserLanguage : IntPtr
        get_userLanguage    : IntPtr
        get_platform        : IntPtr
        get_appMinorVersion : IntPtr
        get_connectionSpeed : IntPtr
        get_onLine          : IntPtr
        get_userProfile     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOmNavigator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    appCodeName {
        get => this.get_appCodeName()
    }

    /**
     * @type {BSTR} 
     */
    appName {
        get => this.get_appName()
    }

    /**
     * @type {BSTR} 
     */
    appVersion {
        get => this.get_appVersion()
    }

    /**
     * @type {BSTR} 
     */
    userAgent {
        get => this.get_userAgent()
    }

    /**
     * @type {IHTMLMimeTypesCollection} 
     */
    mimeTypes {
        get => this.get_mimeTypes()
    }

    /**
     * @type {IHTMLPluginsCollection} 
     */
    plugins {
        get => this.get_plugins()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    cookieEnabled {
        get => this.get_cookieEnabled()
    }

    /**
     * @type {IHTMLOpsProfile} 
     */
    opsProfile {
        get => this.get_opsProfile()
    }

    /**
     * @type {BSTR} 
     */
    cpuClass {
        get => this.get_cpuClass()
    }

    /**
     * @type {BSTR} 
     */
    systemLanguage {
        get => this.get_systemLanguage()
    }

    /**
     * @type {BSTR} 
     */
    browserLanguage {
        get => this.get_browserLanguage()
    }

    /**
     * @type {BSTR} 
     */
    userLanguage {
        get => this.get_userLanguage()
    }

    /**
     * @type {BSTR} 
     */
    platform {
        get => this.get_platform()
    }

    /**
     * @type {BSTR} 
     */
    appMinorVersion {
        get => this.get_appMinorVersion()
    }

    /**
     * @type {Integer} 
     */
    connectionSpeed {
        get => this.get_connectionSpeed()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    onLine {
        get => this.get_onLine()
    }

    /**
     * @type {IHTMLOpsProfile} 
     */
    userProfile {
        get => this.get_userProfile()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_appCodeName() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_appName() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_appVersion() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_userAgent() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    javaEnabled() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    taintEnabled() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &enabled := 0, "HRESULT")
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
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
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
        _string := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, _string, "HRESULT")
        return _string
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cpuClass() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_systemLanguage() {
        p := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_browserLanguage() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_userLanguage() {
        p := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_platform() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_appMinorVersion() {
        p := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, p, "HRESULT")
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
        result := ComCall(25, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
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

    Query(iid) {
        if (IOmNavigator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_appCodeName := CallbackCreate(GetMethod(implObj, "get_appCodeName"), flags, 2)
        this.vtbl.get_appName := CallbackCreate(GetMethod(implObj, "get_appName"), flags, 2)
        this.vtbl.get_appVersion := CallbackCreate(GetMethod(implObj, "get_appVersion"), flags, 2)
        this.vtbl.get_userAgent := CallbackCreate(GetMethod(implObj, "get_userAgent"), flags, 2)
        this.vtbl.javaEnabled := CallbackCreate(GetMethod(implObj, "javaEnabled"), flags, 2)
        this.vtbl.taintEnabled := CallbackCreate(GetMethod(implObj, "taintEnabled"), flags, 2)
        this.vtbl.get_mimeTypes := CallbackCreate(GetMethod(implObj, "get_mimeTypes"), flags, 2)
        this.vtbl.get_plugins := CallbackCreate(GetMethod(implObj, "get_plugins"), flags, 2)
        this.vtbl.get_cookieEnabled := CallbackCreate(GetMethod(implObj, "get_cookieEnabled"), flags, 2)
        this.vtbl.get_opsProfile := CallbackCreate(GetMethod(implObj, "get_opsProfile"), flags, 2)
        this.vtbl.toString := CallbackCreate(GetMethod(implObj, "toString"), flags, 2)
        this.vtbl.get_cpuClass := CallbackCreate(GetMethod(implObj, "get_cpuClass"), flags, 2)
        this.vtbl.get_systemLanguage := CallbackCreate(GetMethod(implObj, "get_systemLanguage"), flags, 2)
        this.vtbl.get_browserLanguage := CallbackCreate(GetMethod(implObj, "get_browserLanguage"), flags, 2)
        this.vtbl.get_userLanguage := CallbackCreate(GetMethod(implObj, "get_userLanguage"), flags, 2)
        this.vtbl.get_platform := CallbackCreate(GetMethod(implObj, "get_platform"), flags, 2)
        this.vtbl.get_appMinorVersion := CallbackCreate(GetMethod(implObj, "get_appMinorVersion"), flags, 2)
        this.vtbl.get_connectionSpeed := CallbackCreate(GetMethod(implObj, "get_connectionSpeed"), flags, 2)
        this.vtbl.get_onLine := CallbackCreate(GetMethod(implObj, "get_onLine"), flags, 2)
        this.vtbl.get_userProfile := CallbackCreate(GetMethod(implObj, "get_userProfile"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_appCodeName)
        CallbackFree(this.vtbl.get_appName)
        CallbackFree(this.vtbl.get_appVersion)
        CallbackFree(this.vtbl.get_userAgent)
        CallbackFree(this.vtbl.javaEnabled)
        CallbackFree(this.vtbl.taintEnabled)
        CallbackFree(this.vtbl.get_mimeTypes)
        CallbackFree(this.vtbl.get_plugins)
        CallbackFree(this.vtbl.get_cookieEnabled)
        CallbackFree(this.vtbl.get_opsProfile)
        CallbackFree(this.vtbl.toString)
        CallbackFree(this.vtbl.get_cpuClass)
        CallbackFree(this.vtbl.get_systemLanguage)
        CallbackFree(this.vtbl.get_browserLanguage)
        CallbackFree(this.vtbl.get_userLanguage)
        CallbackFree(this.vtbl.get_platform)
        CallbackFree(this.vtbl.get_appMinorVersion)
        CallbackFree(this.vtbl.get_connectionSpeed)
        CallbackFree(this.vtbl.get_onLine)
        CallbackFree(this.vtbl.get_userProfile)
    }
}
