#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\RTC_LISTEN_MODE.ahk" { RTC_LISTEN_MODE }
#Import ".\RTC_SECURITY_LEVEL.ahk" { RTC_SECURITY_LEVEL }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IRTCClient.ahk" { IRTCClient }
#Import ".\IRTCSession2.ahk" { IRTCSession2 }
#Import ".\IRTCSessionDescriptionManager.ahk" { IRTCSessionDescriptionManager }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RTC_ANSWER_MODE.ahk" { RTC_ANSWER_MODE }
#Import ".\IRTCProfile.ahk" { IRTCProfile }
#Import ".\RTC_SESSION_TYPE.ahk" { RTC_SESSION_TYPE }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\RTC_SECURITY_TYPE.ahk" { RTC_SECURITY_TYPE }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCClient2 extends IRTCClient {
    /**
     * The interface identifier for IRTCClient2
     * @type {Guid}
     */
    static IID := Guid("{0c91d71d-1064-42da-bfa5-572beb8eea84}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCClient2 interfaces
    */
    struct Vtbl extends IRTCClient.Vtbl {
        put_AnswerMode               : IntPtr
        get_AnswerMode               : IntPtr
        InvokeTuningWizardEx         : IntPtr
        get_Version                  : IntPtr
        put_ClientName               : IntPtr
        put_ClientCurVer             : IntPtr
        InitializeEx                 : IntPtr
        CreateSessionWithDescription : IntPtr
        SetSessionDescriptionManager : IntPtr
        put_PreferredSecurityLevel   : IntPtr
        get_PreferredSecurityLevel   : IntPtr
        put_AllowedPorts             : IntPtr
        get_AllowedPorts             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCClient2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * @type {BSTR} 
     */
    ClientName {
        set => this.put_ClientName(value)
    }

    /**
     * @type {BSTR} 
     */
    ClientCurVer {
        set => this.put_ClientCurVer(value)
    }

    /**
     * 
     * @param {RTC_SESSION_TYPE} enType 
     * @param {RTC_ANSWER_MODE} enMode 
     * @returns {HRESULT} 
     */
    put_AnswerMode(enType, enMode) {
        result := ComCall(45, this, RTC_SESSION_TYPE, enType, RTC_ANSWER_MODE, enMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_SESSION_TYPE} enType 
     * @returns {RTC_ANSWER_MODE} 
     */
    get_AnswerMode(enType) {
        result := ComCall(46, this, RTC_SESSION_TYPE, enType, "int*", &penMode := 0, "HRESULT")
        return penMode
    }

    /**
     * 
     * @param {Pointer} hwndParent 
     * @param {VARIANT_BOOL} fAllowAudio 
     * @param {VARIANT_BOOL} fAllowVideo 
     * @returns {HRESULT} 
     */
    InvokeTuningWizardEx(hwndParent, fAllowAudio, fAllowVideo) {
        result := ComCall(47, this, "ptr", hwndParent, VARIANT_BOOL, fAllowAudio, VARIANT_BOOL, fAllowVideo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Version() {
        result := ComCall(48, this, "int*", &plVersion := 0, "HRESULT")
        return plVersion
    }

    /**
     * 
     * @param {BSTR} bstrClientName 
     * @returns {HRESULT} 
     */
    put_ClientName(bstrClientName) {
        bstrClientName := bstrClientName is String ? BSTR.Alloc(bstrClientName).Value : bstrClientName

        result := ComCall(49, this, BSTR, bstrClientName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrClientCurVer 
     * @returns {HRESULT} 
     */
    put_ClientCurVer(bstrClientCurVer) {
        bstrClientCurVer := bstrClientCurVer is String ? BSTR.Alloc(bstrClientCurVer).Value : bstrClientCurVer

        result := ComCall(50, this, BSTR, bstrClientCurVer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    InitializeEx(lFlags) {
        result := ComCall(51, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrContentType 
     * @param {BSTR} bstrSessionDescription 
     * @param {IRTCProfile} pProfile 
     * @param {Integer} lFlags 
     * @returns {IRTCSession2} 
     */
    CreateSessionWithDescription(bstrContentType, bstrSessionDescription, pProfile, lFlags) {
        bstrContentType := bstrContentType is String ? BSTR.Alloc(bstrContentType).Value : bstrContentType
        bstrSessionDescription := bstrSessionDescription is String ? BSTR.Alloc(bstrSessionDescription).Value : bstrSessionDescription

        result := ComCall(52, this, BSTR, bstrContentType, BSTR, bstrSessionDescription, "ptr", pProfile, "int", lFlags, "ptr*", &ppSession2 := 0, "HRESULT")
        return IRTCSession2(ppSession2)
    }

    /**
     * 
     * @param {IRTCSessionDescriptionManager} pSessionDescriptionManager 
     * @returns {HRESULT} 
     */
    SetSessionDescriptionManager(pSessionDescriptionManager) {
        result := ComCall(53, this, "ptr", pSessionDescriptionManager, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_SECURITY_TYPE} enSecurityType 
     * @param {RTC_SECURITY_LEVEL} enSecurityLevel 
     * @returns {HRESULT} 
     */
    put_PreferredSecurityLevel(enSecurityType, enSecurityLevel) {
        result := ComCall(54, this, RTC_SECURITY_TYPE, enSecurityType, RTC_SECURITY_LEVEL, enSecurityLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_SECURITY_TYPE} enSecurityType 
     * @returns {RTC_SECURITY_LEVEL} 
     */
    get_PreferredSecurityLevel(enSecurityType) {
        result := ComCall(55, this, RTC_SECURITY_TYPE, enSecurityType, "int*", &penSecurityLevel := 0, "HRESULT")
        return penSecurityLevel
    }

    /**
     * 
     * @param {Integer} lTransport 
     * @param {RTC_LISTEN_MODE} enListenMode 
     * @returns {HRESULT} 
     */
    put_AllowedPorts(lTransport, enListenMode) {
        result := ComCall(56, this, "int", lTransport, RTC_LISTEN_MODE, enListenMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lTransport 
     * @returns {RTC_LISTEN_MODE} 
     */
    get_AllowedPorts(lTransport) {
        result := ComCall(57, this, "int", lTransport, "int*", &penListenMode := 0, "HRESULT")
        return penListenMode
    }

    Query(iid) {
        if (IRTCClient2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_AnswerMode := CallbackCreate(GetMethod(implObj, "put_AnswerMode"), flags, 3)
        this.vtbl.get_AnswerMode := CallbackCreate(GetMethod(implObj, "get_AnswerMode"), flags, 3)
        this.vtbl.InvokeTuningWizardEx := CallbackCreate(GetMethod(implObj, "InvokeTuningWizardEx"), flags, 4)
        this.vtbl.get_Version := CallbackCreate(GetMethod(implObj, "get_Version"), flags, 2)
        this.vtbl.put_ClientName := CallbackCreate(GetMethod(implObj, "put_ClientName"), flags, 2)
        this.vtbl.put_ClientCurVer := CallbackCreate(GetMethod(implObj, "put_ClientCurVer"), flags, 2)
        this.vtbl.InitializeEx := CallbackCreate(GetMethod(implObj, "InitializeEx"), flags, 2)
        this.vtbl.CreateSessionWithDescription := CallbackCreate(GetMethod(implObj, "CreateSessionWithDescription"), flags, 6)
        this.vtbl.SetSessionDescriptionManager := CallbackCreate(GetMethod(implObj, "SetSessionDescriptionManager"), flags, 2)
        this.vtbl.put_PreferredSecurityLevel := CallbackCreate(GetMethod(implObj, "put_PreferredSecurityLevel"), flags, 3)
        this.vtbl.get_PreferredSecurityLevel := CallbackCreate(GetMethod(implObj, "get_PreferredSecurityLevel"), flags, 3)
        this.vtbl.put_AllowedPorts := CallbackCreate(GetMethod(implObj, "put_AllowedPorts"), flags, 3)
        this.vtbl.get_AllowedPorts := CallbackCreate(GetMethod(implObj, "get_AllowedPorts"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_AnswerMode)
        CallbackFree(this.vtbl.get_AnswerMode)
        CallbackFree(this.vtbl.InvokeTuningWizardEx)
        CallbackFree(this.vtbl.get_Version)
        CallbackFree(this.vtbl.put_ClientName)
        CallbackFree(this.vtbl.put_ClientCurVer)
        CallbackFree(this.vtbl.InitializeEx)
        CallbackFree(this.vtbl.CreateSessionWithDescription)
        CallbackFree(this.vtbl.SetSessionDescriptionManager)
        CallbackFree(this.vtbl.put_PreferredSecurityLevel)
        CallbackFree(this.vtbl.get_PreferredSecurityLevel)
        CallbackFree(this.vtbl.put_AllowedPorts)
        CallbackFree(this.vtbl.get_AllowedPorts)
    }
}
