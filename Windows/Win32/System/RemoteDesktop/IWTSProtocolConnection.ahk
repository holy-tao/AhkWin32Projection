#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWTSProtocolLogonErrorRedirector.ahk
#Include .\WTS_CLIENT_DATA.ahk
#Include .\WTS_USER_CREDENTIAL.ahk
#Include .\IWTSProtocolLicenseConnection.ahk
#Include .\WTS_SESSION_ID.ahk
#Include .\WTS_PROTOCOL_STATUS.ahk
#Include .\WTS_PROPERTY_VALUE.ahk
#Include .\IWTSProtocolShadowConnection.ahk
#Include ..\Com\IUnknown.ahk

/**
 * IWTSProtocolConnection is no longer available. Instead, use IWRdsProtocolConnection.
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwtsprotocolconnection
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSProtocolConnection extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLogonErrorRedirector", "SendPolicyData", "AcceptConnection", "GetClientData", "GetUserCredentials", "GetLicenseConnection", "AuthenticateClientToSession", "NotifySessionId", "GetProtocolHandles", "ConnectNotify", "IsUserAllowedToLogon", "SessionArbitrationEnumeration", "LogonNotify", "GetUserData", "DisconnectNotify", "Close", "GetProtocolStatus", "GetLastInputTime", "SetErrorInfo", "SendBeep", "CreateVirtualChannel", "QueryProperty", "GetShadowConnection"]

    /**
     * 
     * @returns {IWTSProtocolLogonErrorRedirector} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getlogonerrorredirector
     */
    GetLogonErrorRedirector() {
        result := ComCall(3, this, "ptr*", &ppLogonErrorRedir := 0, "HRESULT")
        return IWTSProtocolLogonErrorRedirector(ppLogonErrorRedir)
    }

    /**
     * 
     * @param {Pointer<WTS_POLICY_DATA>} pPolicyData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-sendpolicydata
     */
    SendPolicyData(pPolicyData) {
        result := ComCall(4, this, "ptr", pPolicyData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-acceptconnection
     */
    AcceptConnection() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {WTS_CLIENT_DATA} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getclientdata
     */
    GetClientData() {
        pClientData := WTS_CLIENT_DATA()
        result := ComCall(6, this, "ptr", pClientData, "HRESULT")
        return pClientData
    }

    /**
     * 
     * @returns {WTS_USER_CREDENTIAL} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getusercredentials
     */
    GetUserCredentials() {
        pUserCreds := WTS_USER_CREDENTIAL()
        result := ComCall(7, this, "ptr", pUserCreds, "HRESULT")
        return pUserCreds
    }

    /**
     * 
     * @returns {IWTSProtocolLicenseConnection} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getlicenseconnection
     */
    GetLicenseConnection() {
        result := ComCall(8, this, "ptr*", &ppLicenseConnection := 0, "HRESULT")
        return IWTSProtocolLicenseConnection(ppLicenseConnection)
    }

    /**
     * 
     * @returns {WTS_SESSION_ID} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-authenticateclienttosession
     */
    AuthenticateClientToSession() {
        SessionId := WTS_SESSION_ID()
        result := ComCall(9, this, "ptr", SessionId, "HRESULT")
        return SessionId
    }

    /**
     * 
     * @param {Pointer<WTS_SESSION_ID>} SessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-notifysessionid
     */
    NotifySessionId(SessionId) {
        result := ComCall(10, this, "ptr", SessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE_PTR>} pKeyboardHandle 
     * @param {Pointer<HANDLE_PTR>} pMouseHandle 
     * @param {Pointer<HANDLE_PTR>} pBeepHandle 
     * @param {Pointer<HANDLE_PTR>} pVideoHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getprotocolhandles
     */
    GetProtocolHandles(pKeyboardHandle, pMouseHandle, pBeepHandle, pVideoHandle) {
        pKeyboardHandleMarshal := pKeyboardHandle is VarRef ? "ptr*" : "ptr"
        pMouseHandleMarshal := pMouseHandle is VarRef ? "ptr*" : "ptr"
        pBeepHandleMarshal := pBeepHandle is VarRef ? "ptr*" : "ptr"
        pVideoHandleMarshal := pVideoHandle is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, pKeyboardHandleMarshal, pKeyboardHandle, pMouseHandleMarshal, pMouseHandle, pBeepHandleMarshal, pBeepHandle, pVideoHandleMarshal, pVideoHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-connectnotify
     */
    ConnectNotify(SessionId) {
        result := ComCall(12, this, "uint", SessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SessionId 
     * @param {HANDLE_PTR} UserToken 
     * @param {PWSTR} pDomainName 
     * @param {PWSTR} pUserName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-isuserallowedtologon
     */
    IsUserAllowedToLogon(SessionId, UserToken, pDomainName, pUserName) {
        pDomainName := pDomainName is String ? StrPtr(pDomainName) : pDomainName
        pUserName := pUserName is String ? StrPtr(pUserName) : pUserName

        result := ComCall(13, this, "uint", SessionId, "ptr", UserToken, "ptr", pDomainName, "ptr", pUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE_PTR} hUserToken 
     * @param {BOOL} bSingleSessionPerUserEnabled 
     * @param {Pointer<Integer>} pdwSessionIdentifierCount 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-sessionarbitrationenumeration
     */
    SessionArbitrationEnumeration(hUserToken, bSingleSessionPerUserEnabled, pdwSessionIdentifierCount) {
        pdwSessionIdentifierCountMarshal := pdwSessionIdentifierCount is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", hUserToken, "int", bSingleSessionPerUserEnabled, "uint*", &pSessionIdArray := 0, pdwSessionIdentifierCountMarshal, pdwSessionIdentifierCount, "HRESULT")
        return pSessionIdArray
    }

    /**
     * 
     * @param {HANDLE_PTR} hClientToken 
     * @param {PWSTR} wszUserName 
     * @param {PWSTR} wszDomainName 
     * @param {Pointer<WTS_SESSION_ID>} SessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-logonnotify
     */
    LogonNotify(hClientToken, wszUserName, wszDomainName, SessionId) {
        wszUserName := wszUserName is String ? StrPtr(wszUserName) : wszUserName
        wszDomainName := wszDomainName is String ? StrPtr(wszDomainName) : wszDomainName

        result := ComCall(15, this, "ptr", hClientToken, "ptr", wszUserName, "ptr", wszDomainName, "ptr", SessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WTS_POLICY_DATA>} pPolicyData 
     * @param {Pointer<WTS_USER_DATA>} pClientData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getuserdata
     */
    GetUserData(pPolicyData, pClientData) {
        result := ComCall(16, this, "ptr", pPolicyData, "ptr", pClientData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-disconnectnotify
     */
    DisconnectNotify() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-close
     */
    Close() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {WTS_PROTOCOL_STATUS} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getprotocolstatus
     */
    GetProtocolStatus() {
        pProtocolStatus := WTS_PROTOCOL_STATUS()
        result := ComCall(19, this, "ptr", pProtocolStatus, "HRESULT")
        return pProtocolStatus
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getlastinputtime
     */
    GetLastInputTime() {
        result := ComCall(20, this, "uint*", &pLastInputTime := 0, "HRESULT")
        return pLastInputTime
    }

    /**
     * Sets the error information object for the current logical thread of execution.
     * @param {Integer} ulError 
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-seterrorinfo
     */
    SetErrorInfo(ulError) {
        result := ComCall(21, this, "uint", ulError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Frequency 
     * @param {Integer} Duration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-sendbeep
     */
    SendBeep(Frequency, Duration) {
        result := ComCall(22, this, "uint", Frequency, "uint", Duration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} szEndpointName 
     * @param {BOOL} bStatic 
     * @param {Integer} RequestedPriority 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-createvirtualchannel
     */
    CreateVirtualChannel(szEndpointName, bStatic, RequestedPriority) {
        szEndpointName := szEndpointName is String ? StrPtr(szEndpointName) : szEndpointName

        result := ComCall(23, this, "ptr", szEndpointName, "int", bStatic, "uint", RequestedPriority, "ptr*", &phChannel := 0, "HRESULT")
        return phChannel
    }

    /**
     * 
     * @param {Guid} QueryType 
     * @param {Integer} ulNumEntriesIn 
     * @param {Integer} ulNumEntriesOut 
     * @param {Pointer<WTS_PROPERTY_VALUE>} pPropertyEntriesIn 
     * @returns {WTS_PROPERTY_VALUE} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-queryproperty
     */
    QueryProperty(QueryType, ulNumEntriesIn, ulNumEntriesOut, pPropertyEntriesIn) {
        pPropertyEntriesOut := WTS_PROPERTY_VALUE()
        result := ComCall(24, this, "ptr", QueryType, "uint", ulNumEntriesIn, "uint", ulNumEntriesOut, "ptr", pPropertyEntriesIn, "ptr", pPropertyEntriesOut, "HRESULT")
        return pPropertyEntriesOut
    }

    /**
     * 
     * @returns {IWTSProtocolShadowConnection} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getshadowconnection
     */
    GetShadowConnection() {
        result := ComCall(25, this, "ptr*", &ppShadowConnection := 0, "HRESULT")
        return IWTSProtocolShadowConnection(ppShadowConnection)
    }
}
