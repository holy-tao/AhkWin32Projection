#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods called by the Remote Desktop Services service to configure a client connection.
 * @remarks
 * 
  * To avoid a possible deadlock when calling any of the methods on this interface, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwrdsprotocolconnection
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsProtocolConnection extends IUnknown{
    /**
     * The interface identifier for IWRdsProtocolConnection
     * @type {Guid}
     */
    static IID => Guid("{324ed94f-fdaf-4ff6-81a8-42abe755830b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IWRdsProtocolLogonErrorRedirector>} ppLogonErrorRedir 
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
     * @returns {HRESULT} 
     */
    AcceptConnection() {
        result := ComCall(4, this, "int")
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
        result := ComCall(5, this, "ptr", pClientData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pNumMonitors 
     * @param {Pointer<UInt32>} pPrimaryMonitor 
     * @returns {HRESULT} 
     */
    GetClientMonitorData(pNumMonitors, pPrimaryMonitor) {
        result := ComCall(6, this, "uint*", pNumMonitors, "uint*", pPrimaryMonitor, "int")
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
     * @param {Pointer<IWRdsProtocolLicenseConnection>} ppLicenseConnection 
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
     * @param {HANDLE_PTR} SessionHandle 
     * @returns {HRESULT} 
     */
    NotifySessionId(SessionId, SessionHandle) {
        result := ComCall(10, this, "ptr", SessionId, "ptr", SessionHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE_PTR>} pKeyboardHandle 
     * @param {Pointer<HANDLE_PTR>} pMouseHandle 
     * @param {Pointer<HANDLE_PTR>} pBeepHandle 
     * @returns {HRESULT} 
     */
    GetInputHandles(pKeyboardHandle, pMouseHandle, pBeepHandle) {
        result := ComCall(11, this, "ptr", pKeyboardHandle, "ptr", pMouseHandle, "ptr", pBeepHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE_PTR>} pVideoHandle 
     * @returns {HRESULT} 
     */
    GetVideoHandle(pVideoHandle) {
        result := ComCall(12, this, "ptr", pVideoHandle, "int")
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
        result := ComCall(13, this, "uint", SessionId, "int")
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

        result := ComCall(14, this, "uint", SessionId, "ptr", UserToken, "ptr", pDomainName, "ptr", pUserName, "int")
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
        result := ComCall(15, this, "ptr", hUserToken, "int", bSingleSessionPerUserEnabled, "uint*", pSessionIdArray, "uint*", pdwSessionIdentifierCount, "int")
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
     * @param {Pointer<WRDS_CONNECTION_SETTINGS>} pWRdsConnectionSettings 
     * @returns {HRESULT} 
     */
    LogonNotify(hClientToken, wszUserName, wszDomainName, SessionId, pWRdsConnectionSettings) {
        wszUserName := wszUserName is String ? StrPtr(wszUserName) : wszUserName
        wszDomainName := wszDomainName is String ? StrPtr(wszDomainName) : wszDomainName

        result := ComCall(16, this, "ptr", hClientToken, "ptr", wszUserName, "ptr", wszDomainName, "ptr", SessionId, "ptr", pWRdsConnectionSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DisconnectReason 
     * @returns {HRESULT} 
     */
    PreDisconnect(DisconnectReason) {
        result := ComCall(17, this, "uint", DisconnectReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisconnectNotify() {
        result := ComCall(18, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(19, this, "int")
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
        result := ComCall(20, this, "ptr", pProtocolStatus, "int")
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
        result := ComCall(21, this, "uint*", pLastInputTime, "int")
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
        result := ComCall(22, this, "uint", ulError, "int")
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
     * @param {Pointer<IWRdsProtocolShadowConnection>} ppShadowConnection 
     * @returns {HRESULT} 
     */
    GetShadowConnection(ppShadowConnection) {
        result := ComCall(25, this, "ptr", ppShadowConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SessionId 
     * @returns {HRESULT} 
     */
    NotifyCommandProcessCreated(SessionId) {
        result := ComCall(26, this, "uint", SessionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
