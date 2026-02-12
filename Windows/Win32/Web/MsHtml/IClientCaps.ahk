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
        result := ComCall(7, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_cookieEnabled() {
        result := ComCall(8, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cpuClass() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_systemLanguage() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_userLanguage() {
        p := BSTR()
        result := ComCall(11, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_platform() {
        p := BSTR()
        result := ComCall(12, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_connectionSpeed() {
        result := ComCall(13, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_onLine() {
        result := ComCall(14, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_colorDepth() {
        result := ComCall(15, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_bufferDepth() {
        result := ComCall(16, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_width() {
        result := ComCall(17, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_height() {
        result := ComCall(18, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_availHeight() {
        result := ComCall(19, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_availWidth() {
        result := ComCall(20, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_connectionType() {
        p := BSTR()
        result := ComCall(21, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }
        if(bstrUrl is String) {
            pin := BSTR.Alloc(bstrUrl)
            bstrUrl := pin.Value
        }
        if(bStrVer is String) {
            pin := BSTR.Alloc(bStrVer)
            bStrVer := pin.Value
        }

        result := ComCall(22, this, "ptr", bstrName, "ptr", bstrUrl, "ptr", bStrVer, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrUrl 
     * @returns {BSTR} 
     */
    getComponentVersion(bstrName, bstrUrl) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }
        if(bstrUrl is String) {
            pin := BSTR.Alloc(bstrUrl)
            bstrUrl := pin.Value
        }

        pbstrVer := BSTR()
        result := ComCall(23, this, "ptr", bstrName, "ptr", bstrUrl, "ptr", pbstrVer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrVer
    }

    /**
     * 
     * @param {BSTR} bstrVer1 
     * @param {BSTR} bstrVer2 
     * @returns {Integer} 
     */
    compareVersions(bstrVer1, bstrVer2) {
        if(bstrVer1 is String) {
            pin := BSTR.Alloc(bstrVer1)
            bstrVer1 := pin.Value
        }
        if(bstrVer2 is String) {
            pin := BSTR.Alloc(bstrVer2)
            bstrVer2 := pin.Value
        }

        result := ComCall(24, this, "ptr", bstrVer1, "ptr", bstrVer2, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }
        if(bstrUrl is String) {
            pin := BSTR.Alloc(bstrUrl)
            bstrUrl := pin.Value
        }
        if(bStrVer is String) {
            pin := BSTR.Alloc(bStrVer)
            bStrVer := pin.Value
        }

        result := ComCall(25, this, "ptr", bstrName, "ptr", bstrUrl, "ptr", bStrVer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    doComponentRequest() {
        result := ComCall(26, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    clearComponentRequest() {
        result := ComCall(27, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
