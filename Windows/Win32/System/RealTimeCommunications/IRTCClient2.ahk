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
     * 
     * @param {Integer} enType 
     * @param {Integer} enMode 
     * @returns {HRESULT} 
     */
    put_AnswerMode(enType, enMode) {
        result := ComCall(45, this, "int", enType, "int", enMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enType 
     * @param {Pointer<Int32>} penMode 
     * @returns {HRESULT} 
     */
    get_AnswerMode(enType, penMode) {
        result := ComCall(46, this, "int", enType, "int*", penMode, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(47, this, "ptr", hwndParent, "short", fAllowAudio, "short", fAllowVideo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plVersion 
     * @returns {HRESULT} 
     */
    get_Version(plVersion) {
        result := ComCall(48, this, "int*", plVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrClientName 
     * @returns {HRESULT} 
     */
    put_ClientName(bstrClientName) {
        bstrClientName := bstrClientName is String ? BSTR.Alloc(bstrClientName).Value : bstrClientName

        result := ComCall(49, this, "ptr", bstrClientName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrClientCurVer 
     * @returns {HRESULT} 
     */
    put_ClientCurVer(bstrClientCurVer) {
        bstrClientCurVer := bstrClientCurVer is String ? BSTR.Alloc(bstrClientCurVer).Value : bstrClientCurVer

        result := ComCall(50, this, "ptr", bstrClientCurVer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    InitializeEx(lFlags) {
        result := ComCall(51, this, "int", lFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrContentType 
     * @param {BSTR} bstrSessionDescription 
     * @param {Pointer<IRTCProfile>} pProfile 
     * @param {Integer} lFlags 
     * @param {Pointer<IRTCSession2>} ppSession2 
     * @returns {HRESULT} 
     */
    CreateSessionWithDescription(bstrContentType, bstrSessionDescription, pProfile, lFlags, ppSession2) {
        bstrContentType := bstrContentType is String ? BSTR.Alloc(bstrContentType).Value : bstrContentType
        bstrSessionDescription := bstrSessionDescription is String ? BSTR.Alloc(bstrSessionDescription).Value : bstrSessionDescription

        result := ComCall(52, this, "ptr", bstrContentType, "ptr", bstrSessionDescription, "ptr", pProfile, "int", lFlags, "ptr", ppSession2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCSessionDescriptionManager>} pSessionDescriptionManager 
     * @returns {HRESULT} 
     */
    SetSessionDescriptionManager(pSessionDescriptionManager) {
        result := ComCall(53, this, "ptr", pSessionDescriptionManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enSecurityType 
     * @param {Integer} enSecurityLevel 
     * @returns {HRESULT} 
     */
    put_PreferredSecurityLevel(enSecurityType, enSecurityLevel) {
        result := ComCall(54, this, "int", enSecurityType, "int", enSecurityLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enSecurityType 
     * @param {Pointer<Int32>} penSecurityLevel 
     * @returns {HRESULT} 
     */
    get_PreferredSecurityLevel(enSecurityType, penSecurityLevel) {
        result := ComCall(55, this, "int", enSecurityType, "int*", penSecurityLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lTransport 
     * @param {Integer} enListenMode 
     * @returns {HRESULT} 
     */
    put_AllowedPorts(lTransport, enListenMode) {
        result := ComCall(56, this, "int", lTransport, "int", enListenMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lTransport 
     * @param {Pointer<Int32>} penListenMode 
     * @returns {HRESULT} 
     */
    get_AllowedPorts(lTransport, penListenMode) {
        result := ComCall(57, this, "int", lTransport, "int*", penListenMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
