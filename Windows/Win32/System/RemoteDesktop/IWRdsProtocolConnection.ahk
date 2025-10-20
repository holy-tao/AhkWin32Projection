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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLogonErrorRedirector", "AcceptConnection", "GetClientData", "GetClientMonitorData", "GetUserCredentials", "GetLicenseConnection", "AuthenticateClientToSession", "NotifySessionId", "GetInputHandles", "GetVideoHandle", "ConnectNotify", "IsUserAllowedToLogon", "SessionArbitrationEnumeration", "LogonNotify", "PreDisconnect", "DisconnectNotify", "Close", "GetProtocolStatus", "GetLastInputTime", "SetErrorInfo", "CreateVirtualChannel", "QueryProperty", "GetShadowConnection", "NotifyCommandProcessCreated"]

    /**
     * 
     * @param {Pointer<IWRdsProtocolLogonErrorRedirector>} ppLogonErrorRedir 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getlogonerrorredirector
     */
    GetLogonErrorRedirector(ppLogonErrorRedir) {
        result := ComCall(3, this, "ptr*", ppLogonErrorRedir, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-acceptconnection
     */
    AcceptConnection() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WTS_CLIENT_DATA>} pClientData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getclientdata
     */
    GetClientData(pClientData) {
        result := ComCall(5, this, "ptr", pClientData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pNumMonitors 
     * @param {Pointer<Integer>} pPrimaryMonitor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getclientmonitordata
     */
    GetClientMonitorData(pNumMonitors, pPrimaryMonitor) {
        result := ComCall(6, this, "uint*", pNumMonitors, "uint*", pPrimaryMonitor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WTS_USER_CREDENTIAL>} pUserCreds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getusercredentials
     */
    GetUserCredentials(pUserCreds) {
        result := ComCall(7, this, "ptr", pUserCreds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWRdsProtocolLicenseConnection>} ppLicenseConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getlicenseconnection
     */
    GetLicenseConnection(ppLicenseConnection) {
        result := ComCall(8, this, "ptr*", ppLicenseConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WTS_SESSION_ID>} SessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-authenticateclienttosession
     */
    AuthenticateClientToSession(SessionId) {
        result := ComCall(9, this, "ptr", SessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WTS_SESSION_ID>} SessionId 
     * @param {HANDLE_PTR} SessionHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-notifysessionid
     */
    NotifySessionId(SessionId, SessionHandle) {
        result := ComCall(10, this, "ptr", SessionId, "ptr", SessionHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE_PTR>} pKeyboardHandle 
     * @param {Pointer<HANDLE_PTR>} pMouseHandle 
     * @param {Pointer<HANDLE_PTR>} pBeepHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getinputhandles
     */
    GetInputHandles(pKeyboardHandle, pMouseHandle, pBeepHandle) {
        result := ComCall(11, this, "ptr", pKeyboardHandle, "ptr", pMouseHandle, "ptr", pBeepHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE_PTR>} pVideoHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getvideohandle
     */
    GetVideoHandle(pVideoHandle) {
        result := ComCall(12, this, "ptr", pVideoHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-connectnotify
     */
    ConnectNotify(SessionId) {
        result := ComCall(13, this, "uint", SessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SessionId 
     * @param {HANDLE_PTR} UserToken 
     * @param {PWSTR} pDomainName 
     * @param {PWSTR} pUserName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-isuserallowedtologon
     */
    IsUserAllowedToLogon(SessionId, UserToken, pDomainName, pUserName) {
        pDomainName := pDomainName is String ? StrPtr(pDomainName) : pDomainName
        pUserName := pUserName is String ? StrPtr(pUserName) : pUserName

        result := ComCall(14, this, "uint", SessionId, "ptr", UserToken, "ptr", pDomainName, "ptr", pUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE_PTR} hUserToken 
     * @param {BOOL} bSingleSessionPerUserEnabled 
     * @param {Pointer<Integer>} pSessionIdArray 
     * @param {Pointer<Integer>} pdwSessionIdentifierCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-sessionarbitrationenumeration
     */
    SessionArbitrationEnumeration(hUserToken, bSingleSessionPerUserEnabled, pSessionIdArray, pdwSessionIdentifierCount) {
        result := ComCall(15, this, "ptr", hUserToken, "int", bSingleSessionPerUserEnabled, "uint*", pSessionIdArray, "uint*", pdwSessionIdentifierCount, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-logonnotify
     */
    LogonNotify(hClientToken, wszUserName, wszDomainName, SessionId, pWRdsConnectionSettings) {
        wszUserName := wszUserName is String ? StrPtr(wszUserName) : wszUserName
        wszDomainName := wszDomainName is String ? StrPtr(wszDomainName) : wszDomainName

        result := ComCall(16, this, "ptr", hClientToken, "ptr", wszUserName, "ptr", wszDomainName, "ptr", SessionId, "ptr", pWRdsConnectionSettings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DisconnectReason 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-predisconnect
     */
    PreDisconnect(DisconnectReason) {
        result := ComCall(17, this, "uint", DisconnectReason, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-disconnectnotify
     */
    DisconnectNotify() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-close
     */
    Close() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WTS_PROTOCOL_STATUS>} pProtocolStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getprotocolstatus
     */
    GetProtocolStatus(pProtocolStatus) {
        result := ComCall(20, this, "ptr", pProtocolStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLastInputTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getlastinputtime
     */
    GetLastInputTime(pLastInputTime) {
        result := ComCall(21, this, "uint*", pLastInputTime, "HRESULT")
        return result
    }

    /**
     * Sets the error information object for the current logical thread of execution.
     * @param {Integer} ulError 
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-seterrorinfo
     */
    SetErrorInfo(ulError) {
        result := ComCall(22, this, "uint", ulError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} szEndpointName 
     * @param {BOOL} bStatic 
     * @param {Integer} RequestedPriority 
     * @param {Pointer<Pointer>} phChannel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-createvirtualchannel
     */
    CreateVirtualChannel(szEndpointName, bStatic, RequestedPriority, phChannel) {
        result := ComCall(23, this, "ptr", szEndpointName, "int", bStatic, "uint", RequestedPriority, "ptr*", phChannel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} QueryType 
     * @param {Integer} ulNumEntriesIn 
     * @param {Integer} ulNumEntriesOut 
     * @param {Pointer<WTS_PROPERTY_VALUE>} pPropertyEntriesIn 
     * @param {Pointer<WTS_PROPERTY_VALUE>} pPropertyEntriesOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-queryproperty
     */
    QueryProperty(QueryType, ulNumEntriesIn, ulNumEntriesOut, pPropertyEntriesIn, pPropertyEntriesOut) {
        result := ComCall(24, this, "ptr", QueryType, "uint", ulNumEntriesIn, "uint", ulNumEntriesOut, "ptr", pPropertyEntriesIn, "ptr", pPropertyEntriesOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWRdsProtocolShadowConnection>} ppShadowConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getshadowconnection
     */
    GetShadowConnection(ppShadowConnection) {
        result := ComCall(25, this, "ptr*", ppShadowConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-notifycommandprocesscreated
     */
    NotifyCommandProcessCreated(SessionId) {
        result := ComCall(26, this, "uint", SessionId, "HRESULT")
        return result
    }
}
