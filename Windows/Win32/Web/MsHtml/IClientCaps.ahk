#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IClientCaps extends IDispatch {
    /**
     * The interface identifier for IClientCaps
     * @type {Guid}
     */
    static IID := Guid("{7e8bc44d-aeff-11d1-89c2-00c04fb6bfc4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IClientCaps interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_javaEnabled       : IntPtr
        get_cookieEnabled     : IntPtr
        get_cpuClass          : IntPtr
        get_systemLanguage    : IntPtr
        get_userLanguage      : IntPtr
        get_platform          : IntPtr
        get_connectionSpeed   : IntPtr
        get_onLine            : IntPtr
        get_colorDepth        : IntPtr
        get_bufferDepth       : IntPtr
        get_width             : IntPtr
        get_height            : IntPtr
        get_availHeight       : IntPtr
        get_availWidth        : IntPtr
        get_connectionType    : IntPtr
        isComponentInstalled  : IntPtr
        getComponentVersion   : IntPtr
        compareVersions       : IntPtr
        addComponentRequest   : IntPtr
        doComponentRequest    : IntPtr
        clearComponentRequest : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IClientCaps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    javaEnabled {
        get => this.get_javaEnabled()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    cookieEnabled {
        get => this.get_cookieEnabled()
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
     * @type {Integer} 
     */
    colorDepth {
        get => this.get_colorDepth()
    }

    /**
     * @type {Integer} 
     */
    bufferDepth {
        get => this.get_bufferDepth()
    }

    /**
     * @type {Integer} 
     */
    width {
        get => this.get_width()
    }

    /**
     * @type {Integer} 
     */
    height {
        get => this.get_height()
    }

    /**
     * @type {Integer} 
     */
    availHeight {
        get => this.get_availHeight()
    }

    /**
     * @type {Integer} 
     */
    availWidth {
        get => this.get_availWidth()
    }

    /**
     * @type {BSTR} 
     */
    connectionType {
        get => this.get_connectionType()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_javaEnabled() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_cookieEnabled() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cpuClass() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_systemLanguage() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_userLanguage() {
        p := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_platform() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
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
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
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
        p := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, p, "HRESULT")
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

        result := ComCall(22, this, BSTR, bstrName, BSTR, bstrUrl, BSTR, bStrVer, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
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

        pbstrVer := BSTR.Owned()
        result := ComCall(23, this, BSTR, bstrName, BSTR, bstrUrl, BSTR.Ptr, pbstrVer, "HRESULT")
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

        result := ComCall(24, this, BSTR, bstrVer1, BSTR, bstrVer2, "int*", &p := 0, "HRESULT")
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

        result := ComCall(25, this, BSTR, bstrName, BSTR, bstrUrl, BSTR, bStrVer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    doComponentRequest() {
        result := ComCall(26, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
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

    Query(iid) {
        if (IClientCaps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_javaEnabled := CallbackCreate(GetMethod(implObj, "get_javaEnabled"), flags, 2)
        this.vtbl.get_cookieEnabled := CallbackCreate(GetMethod(implObj, "get_cookieEnabled"), flags, 2)
        this.vtbl.get_cpuClass := CallbackCreate(GetMethod(implObj, "get_cpuClass"), flags, 2)
        this.vtbl.get_systemLanguage := CallbackCreate(GetMethod(implObj, "get_systemLanguage"), flags, 2)
        this.vtbl.get_userLanguage := CallbackCreate(GetMethod(implObj, "get_userLanguage"), flags, 2)
        this.vtbl.get_platform := CallbackCreate(GetMethod(implObj, "get_platform"), flags, 2)
        this.vtbl.get_connectionSpeed := CallbackCreate(GetMethod(implObj, "get_connectionSpeed"), flags, 2)
        this.vtbl.get_onLine := CallbackCreate(GetMethod(implObj, "get_onLine"), flags, 2)
        this.vtbl.get_colorDepth := CallbackCreate(GetMethod(implObj, "get_colorDepth"), flags, 2)
        this.vtbl.get_bufferDepth := CallbackCreate(GetMethod(implObj, "get_bufferDepth"), flags, 2)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
        this.vtbl.get_height := CallbackCreate(GetMethod(implObj, "get_height"), flags, 2)
        this.vtbl.get_availHeight := CallbackCreate(GetMethod(implObj, "get_availHeight"), flags, 2)
        this.vtbl.get_availWidth := CallbackCreate(GetMethod(implObj, "get_availWidth"), flags, 2)
        this.vtbl.get_connectionType := CallbackCreate(GetMethod(implObj, "get_connectionType"), flags, 2)
        this.vtbl.isComponentInstalled := CallbackCreate(GetMethod(implObj, "isComponentInstalled"), flags, 5)
        this.vtbl.getComponentVersion := CallbackCreate(GetMethod(implObj, "getComponentVersion"), flags, 4)
        this.vtbl.compareVersions := CallbackCreate(GetMethod(implObj, "compareVersions"), flags, 4)
        this.vtbl.addComponentRequest := CallbackCreate(GetMethod(implObj, "addComponentRequest"), flags, 4)
        this.vtbl.doComponentRequest := CallbackCreate(GetMethod(implObj, "doComponentRequest"), flags, 2)
        this.vtbl.clearComponentRequest := CallbackCreate(GetMethod(implObj, "clearComponentRequest"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_javaEnabled)
        CallbackFree(this.vtbl.get_cookieEnabled)
        CallbackFree(this.vtbl.get_cpuClass)
        CallbackFree(this.vtbl.get_systemLanguage)
        CallbackFree(this.vtbl.get_userLanguage)
        CallbackFree(this.vtbl.get_platform)
        CallbackFree(this.vtbl.get_connectionSpeed)
        CallbackFree(this.vtbl.get_onLine)
        CallbackFree(this.vtbl.get_colorDepth)
        CallbackFree(this.vtbl.get_bufferDepth)
        CallbackFree(this.vtbl.get_width)
        CallbackFree(this.vtbl.get_height)
        CallbackFree(this.vtbl.get_availHeight)
        CallbackFree(this.vtbl.get_availWidth)
        CallbackFree(this.vtbl.get_connectionType)
        CallbackFree(this.vtbl.isComponentInstalled)
        CallbackFree(this.vtbl.getComponentVersion)
        CallbackFree(this.vtbl.compareVersions)
        CallbackFree(this.vtbl.addComponentRequest)
        CallbackFree(this.vtbl.doComponentRequest)
        CallbackFree(this.vtbl.clearComponentRequest)
    }
}
