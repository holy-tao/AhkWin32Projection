#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRTCSession2.ahk
#Include .\IRTCClient.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCClient2 extends IRTCClient{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCClient2
     * @type {Guid}
     */
    static IID => Guid("{0c91d71d-1064-42da-bfa5-572beb8eea84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 45

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_AnswerMode", "get_AnswerMode", "InvokeTuningWizardEx", "get_Version", "put_ClientName", "put_ClientCurVer", "InitializeEx", "CreateSessionWithDescription", "SetSessionDescriptionManager", "put_PreferredSecurityLevel", "get_PreferredSecurityLevel", "put_AllowedPorts", "get_AllowedPorts"]

    /**
     * @type {Integer} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * @type {HRESULT} 
     */
    ClientName {
        set => this.put_ClientName(value)
    }

    /**
     * @type {HRESULT} 
     */
    ClientCurVer {
        set => this.put_ClientCurVer(value)
    }

    /**
     * 
     * @param {Integer} enType 
     * @param {Integer} enMode 
     * @returns {HRESULT} 
     */
    put_AnswerMode(enType, enMode) {
        result := ComCall(45, this, "int", enType, "int", enMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enType 
     * @returns {Integer} 
     */
    get_AnswerMode(enType) {
        result := ComCall(46, this, "int", enType, "int*", &penMode := 0, "HRESULT")
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
        result := ComCall(47, this, "ptr", hwndParent, "short", fAllowAudio, "short", fAllowVideo, "HRESULT")
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

        result := ComCall(49, this, "ptr", bstrClientName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrClientCurVer 
     * @returns {HRESULT} 
     */
    put_ClientCurVer(bstrClientCurVer) {
        bstrClientCurVer := bstrClientCurVer is String ? BSTR.Alloc(bstrClientCurVer).Value : bstrClientCurVer

        result := ComCall(50, this, "ptr", bstrClientCurVer, "HRESULT")
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

        result := ComCall(52, this, "ptr", bstrContentType, "ptr", bstrSessionDescription, "ptr", pProfile, "int", lFlags, "ptr*", &ppSession2 := 0, "HRESULT")
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
     * @param {Integer} enSecurityType 
     * @param {Integer} enSecurityLevel 
     * @returns {HRESULT} 
     */
    put_PreferredSecurityLevel(enSecurityType, enSecurityLevel) {
        result := ComCall(54, this, "int", enSecurityType, "int", enSecurityLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enSecurityType 
     * @returns {Integer} 
     */
    get_PreferredSecurityLevel(enSecurityType) {
        result := ComCall(55, this, "int", enSecurityType, "int*", &penSecurityLevel := 0, "HRESULT")
        return penSecurityLevel
    }

    /**
     * 
     * @param {Integer} lTransport 
     * @param {Integer} enListenMode 
     * @returns {HRESULT} 
     */
    put_AllowedPorts(lTransport, enListenMode) {
        result := ComCall(56, this, "int", lTransport, "int", enListenMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lTransport 
     * @returns {Integer} 
     */
    get_AllowedPorts(lTransport) {
        result := ComCall(57, this, "int", lTransport, "int*", &penListenMode := 0, "HRESULT")
        return penListenMode
    }
}
