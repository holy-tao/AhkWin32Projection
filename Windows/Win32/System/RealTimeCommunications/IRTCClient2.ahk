#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<Integer>} penMode 
     * @returns {HRESULT} 
     */
    get_AnswerMode(enType, penMode) {
        penModeMarshal := penMode is VarRef ? "int*" : "ptr"

        result := ComCall(46, this, "int", enType, penModeMarshal, penMode, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plVersion 
     * @returns {HRESULT} 
     */
    get_Version(plVersion) {
        plVersionMarshal := plVersion is VarRef ? "int*" : "ptr"

        result := ComCall(48, this, plVersionMarshal, plVersion, "HRESULT")
        return result
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
     * @param {Pointer<IRTCSession2>} ppSession2 
     * @returns {HRESULT} 
     */
    CreateSessionWithDescription(bstrContentType, bstrSessionDescription, pProfile, lFlags, ppSession2) {
        bstrContentType := bstrContentType is String ? BSTR.Alloc(bstrContentType).Value : bstrContentType
        bstrSessionDescription := bstrSessionDescription is String ? BSTR.Alloc(bstrSessionDescription).Value : bstrSessionDescription

        result := ComCall(52, this, "ptr", bstrContentType, "ptr", bstrSessionDescription, "ptr", pProfile, "int", lFlags, "ptr*", ppSession2, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} penSecurityLevel 
     * @returns {HRESULT} 
     */
    get_PreferredSecurityLevel(enSecurityType, penSecurityLevel) {
        penSecurityLevelMarshal := penSecurityLevel is VarRef ? "int*" : "ptr"

        result := ComCall(55, this, "int", enSecurityType, penSecurityLevelMarshal, penSecurityLevel, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} penListenMode 
     * @returns {HRESULT} 
     */
    get_AllowedPorts(lTransport, penListenMode) {
        penListenModeMarshal := penListenMode is VarRef ? "int*" : "ptr"

        result := ComCall(57, this, "int", lTransport, penListenModeMarshal, penListenMode, "HRESULT")
        return result
    }
}
