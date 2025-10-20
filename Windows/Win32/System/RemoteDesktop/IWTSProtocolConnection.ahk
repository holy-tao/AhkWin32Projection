#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * IWTSProtocolConnection is no longer available. Instead, use IWRdsProtocolConnection.
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwtsprotocolconnection
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSProtocolConnection extends IUnknown{
    /**
     * The interface identifier for IWTSProtocolConnection
     * @type {Guid}
     */
    static IID => Guid("{23083765-9095-4648-98bf-ef81c914032d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IWTSProtocolLogonErrorRedirector>} ppLogonErrorRedir 
     * @returns {HRESULT} 
     */
    GetLogonErrorRedirector(ppLogonErrorRedir) {
        result := ComCall(3, this, "ptr", ppLogonErrorRedir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WTS_POLICY_DATA>} pPolicyData 
     * @returns {HRESULT} 
     */
    SendPolicyData(pPolicyData) {
        result := ComCall(4, this, "ptr", pPolicyData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AcceptConnection() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WTS_CLIENT_DATA>} pClientData 
     * @returns {HRESULT} 
     */
    GetClientData(pClientData) {
        result := ComCall(6, this, "ptr", pClientData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WTS_USER_CREDENTIAL>} pUserCreds 
     * @returns {HRESULT} 
     */
    GetUserCredentials(pUserCreds) {
        result := ComCall(7, this, "ptr", pUserCreds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWTSProtocolLicenseConnection>} ppLicenseConnection 
     * @returns {HRESULT} 
     */
    GetLicenseConnection(ppLicenseConnection) {
        result := ComCall(8, this, "ptr", ppLicenseConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WTS_SESSION_ID>} SessionId 
     * @returns {HRESULT} 
     */
    AuthenticateClientToSession(SessionId) {
        result := ComCall(9, this, "ptr", SessionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WTS_SESSION_ID>} SessionId 
     * @returns {HRESULT} 
     */
    NotifySessionId(SessionId) {
        result := ComCall(10, this, "ptr", SessionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE_PTR>} pKeyboardHandle 
     * @param {Pointer<HANDLE_PTR>} pMouseHandle 
     * @param {Pointer<HANDLE_PTR>} pBeepHandle 
     * @param {Pointer<HANDLE_PTR>} pVideoHandle 
     * @returns {HRESULT} 
     */
    GetProtocolHandles(pKeyboardHandle, pMouseHandle, pBeepHandle, pVideoHandle) {
        result := ComCall(11, this, "ptr", pKeyboardHandle, "ptr", pMouseHandle, "ptr", pBeepHandle, "ptr", pVideoHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SessionId 
     * @returns {HRESULT} 
     */
    ConnectNotify(SessionId) {
        result := ComCall(12, this, "uint", SessionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SessionId 
     * @param {HANDLE_PTR} UserToken 
     * @param {PWSTR} pDomainName 
     * @param {PWSTR} pUserName 
     * @returns {HRESULT} 
     */
    IsUserAllowedToLogon(SessionId, UserToken, pDomainName, pUserName) {
        pDomainName := pDomainName is String ? StrPtr(pDomainName) : pDomainName
        pUserName := pUserName is String ? StrPtr(pUserName) : pUserName

        result := ComCall(13, this, "uint", SessionId, "ptr", UserToken, "ptr", pDomainName, "ptr", pUserName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE_PTR} hUserToken 
     * @param {BOOL} bSingleSessionPerUserEnabled 
     * @param {Pointer<UInt32>} pSessionIdArray 
     * @param {Pointer<UInt32>} pdwSessionIdentifierCount 
     * @returns {HRESULT} 
     */
    SessionArbitrationEnumeration(hUserToken, bSingleSessionPerUserEnabled, pSessionIdArray, pdwSessionIdentifierCount) {
        result := ComCall(14, this, "ptr", hUserToken, "int", bSingleSessionPerUserEnabled, "uint*", pSessionIdArray, "uint*", pdwSessionIdentifierCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE_PTR} hClientToken 
     * @param {PWSTR} wszUserName 
     * @param {PWSTR} wszDomainName 
     * @param {Pointer<WTS_SESSION_ID>} SessionId 
     * @returns {HRESULT} 
     */
    LogonNotify(hClientToken, wszUserName, wszDomainName, SessionId) {
        wszUserName := wszUserName is String ? StrPtr(wszUserName) : wszUserName
        wszDomainName := wszDomainName is String ? StrPtr(wszDomainName) : wszDomainName

        result := ComCall(15, this, "ptr", hClientToken, "ptr", wszUserName, "ptr", wszDomainName, "ptr", SessionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WTS_POLICY_DATA>} pPolicyData 
     * @param {Pointer<WTS_USER_DATA>} pClientData 
     * @returns {HRESULT} 
     */
    GetUserData(pPolicyData, pClientData) {
        result := ComCall(16, this, "ptr", pPolicyData, "ptr", pClientData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisconnectNotify() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(18, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WTS_PROTOCOL_STATUS>} pProtocolStatus 
     * @returns {HRESULT} 
     */
    GetProtocolStatus(pProtocolStatus) {
        result := ComCall(19, this, "ptr", pProtocolStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pLastInputTime 
     * @returns {HRESULT} 
     */
    GetLastInputTime(pLastInputTime) {
        result := ComCall(20, this, "uint*", pLastInputTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the error information object for the current logical thread of execution.
     * @param {Integer} ulError 
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-seterrorinfo
     */
    SetErrorInfo(ulError) {
        result := ComCall(21, this, "uint", ulError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Frequency 
     * @param {Integer} Duration 
     * @returns {HRESULT} 
     */
    SendBeep(Frequency, Duration) {
        result := ComCall(22, this, "uint", Frequency, "uint", Duration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} szEndpointName 
     * @param {BOOL} bStatic 
     * @param {Integer} RequestedPriority 
     * @param {Pointer<UIntPtr>} phChannel 
     * @returns {HRESULT} 
     */
    CreateVirtualChannel(szEndpointName, bStatic, RequestedPriority, phChannel) {
        result := ComCall(23, this, "ptr", szEndpointName, "int", bStatic, "uint", RequestedPriority, "ptr*", phChannel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} QueryType 
     * @param {Integer} ulNumEntriesIn 
     * @param {Integer} ulNumEntriesOut 
     * @param {Pointer<WTS_PROPERTY_VALUE>} pPropertyEntriesIn 
     * @param {Pointer<WTS_PROPERTY_VALUE>} pPropertyEntriesOut 
     * @returns {HRESULT} 
     */
    QueryProperty(QueryType, ulNumEntriesIn, ulNumEntriesOut, pPropertyEntriesIn, pPropertyEntriesOut) {
        result := ComCall(24, this, "ptr", QueryType, "uint", ulNumEntriesIn, "uint", ulNumEntriesOut, "ptr", pPropertyEntriesIn, "ptr", pPropertyEntriesOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWTSProtocolShadowConnection>} ppShadowConnection 
     * @returns {HRESULT} 
     */
    GetShadowConnection(ppShadowConnection) {
        result := ComCall(25, this, "ptr", ppShadowConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
