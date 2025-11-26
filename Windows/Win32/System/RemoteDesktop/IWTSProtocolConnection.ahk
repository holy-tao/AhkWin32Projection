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
     * IWTSProtocolConnection::GetLogonErrorRedirector is no longer available. Instead, use IWRdsProtocolConnection::GetLogonErrorRedirector.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocollogonerrorredirector">IWTSProtocolLogonErrorRedirector</a> interface is implemented by the protocol to receive status and error messages from the Remote Desktop Services service.
     * 
     * 
     * @returns {IWTSProtocolLogonErrorRedirector} Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocollogonerrorredirector">IWTSProtocolLogonErrorRedirector</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getlogonerrorredirector
     */
    GetLogonErrorRedirector() {
        result := ComCall(3, this, "ptr*", &ppLogonErrorRedir := 0, "HRESULT")
        return IWTSProtocolLogonErrorRedirector(ppLogonErrorRedir)
    }

    /**
     * IWTSProtocolConnection::SendPolicyData is no longer available. Instead, use IWRdsProtocolManager::NotifySettingsChange.
     * @remarks
     * 
     * The <b>SendPolicyData</b> method is the second method called by the Remote Desktop Services service during a connection sequence.  The protocol must call the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnectioncallback-onready">OnReady</a> method after this method is called, or the connection is dropped.
     * 
     * 
     * @param {Pointer<WTS_POLICY_DATA>} pPolicyData A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_policy_data">WTS_POLICY_DATA</a> structure that contains computer policy settings.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-sendpolicydata
     */
    SendPolicyData(pPolicyData) {
        result := ComCall(4, this, "ptr", pPolicyData, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnection::AcceptConnection is no longer available. Instead, use IWRdsProtocolConnection::AcceptConnection.
     * @remarks
     * 
     * During a connection sequence, the Remote Desktop Services service calls this method after it receives a connection request from a client and after it calls the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-sendpolicydata">SendPolicyData</a> method.
     * 
     * 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-acceptconnection
     */
    AcceptConnection() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnection::GetClientData is no longer available. Instead, use IWRdsProtocolConnection::GetClientData.
     * @returns {WTS_CLIENT_DATA} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_client_data">WTS_CLIENT_DATA</a> structure that contains the client settings.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getclientdata
     */
    GetClientData() {
        pClientData := WTS_CLIENT_DATA()
        result := ComCall(6, this, "ptr", pClientData, "HRESULT")
        return pClientData
    }

    /**
     * IWTSProtocolConnection::GetUserCredentials is no longer available. Instead, use IWRdsProtocolConnection::GetUserCredentials.
     * @returns {WTS_USER_CREDENTIAL} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_user_credential">WTS_USER_CREDENTIAL</a> structure that contains the credentials. Currently, only the user name, password, and domain are supported. The user name and password are plaintext.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getusercredentials
     */
    GetUserCredentials() {
        pUserCreds := WTS_USER_CREDENTIAL()
        result := ComCall(7, this, "ptr", pUserCreds, "HRESULT")
        return pUserCreds
    }

    /**
     * IWTSProtocolConnection::GetLicenseConnection is no longer available. Instead, use IWRdsProtocolConnection::GetLicenseConnection.
     * @returns {IWTSProtocolLicenseConnection} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocollicenseconnection">IWTSProtocolLicenseConnection</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getlicenseconnection
     */
    GetLicenseConnection() {
        result := ComCall(8, this, "ptr*", &ppLicenseConnection := 0, "HRESULT")
        return IWTSProtocolLicenseConnection(ppLicenseConnection)
    }

    /**
     * IWTSProtocolConnection::AuthenticateClientToSession is no longer available. Instead, use IWRdsProtocolConnection::AuthenticateClientToSession.
     * @returns {WTS_SESSION_ID} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WTS_SESSION_ID</a> structure that uniquely identifies the session.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-authenticateclienttosession
     */
    AuthenticateClientToSession() {
        SessionId := WTS_SESSION_ID()
        result := ComCall(9, this, "ptr", SessionId, "HRESULT")
        return SessionId
    }

    /**
     * IWTSProtocolConnection::NotifySessionId is no longer available. Instead, use IWRdsProtocolConnection::NotifySessionId.
     * @remarks
     * 
     * This is an event notification and you should return immediately from this method. To avoid a possible deadlock, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
     * 
     * 
     * @param {Pointer<WTS_SESSION_ID>} SessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WTS_SESSION_ID</a> structure that contains a connection GUID and the associated session ID.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-notifysessionid
     */
    NotifySessionId(SessionId) {
        result := ComCall(10, this, "ptr", SessionId, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnection::GetProtocolHandles is no longer available.
     * @param {Pointer<HANDLE_PTR>} pKeyboardHandle A pointer to a keyboard handle. This is a handle to an <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/index">I8042prt keyboard driver</a>.
     * @param {Pointer<HANDLE_PTR>} pMouseHandle A pointer to a mouse handle. This is a handle to a <a href="https://docs.microsoft.com/previous-versions/ff542367(v=vs.85)">Mouclass driver</a>.
     * @param {Pointer<HANDLE_PTR>} pBeepHandle A pointer to a beep device handle. This handle is not used and must be set to <b>NULL</b>.
     * @param {Pointer<HANDLE_PTR>} pVideoHandle A pointer to a video device handle. This is a handle to the video miniport driver for the remote session associated with the protocol.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getprotocolhandles
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
     * IWTSProtocolConnection::ConnectNotify is no longer available. Instead, use IWRdsProtocolConnection::ConnectNotify.
     * @remarks
     * 
     * This is an event notification and you should return immediately from this method. To avoid a possible deadlock, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
     * 
     * 
     * @param {Integer} SessionId An integer that contains the session ID associated with the client.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-connectnotify
     */
    ConnectNotify(SessionId) {
        result := ComCall(12, this, "uint", SessionId, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnection::IsUserAllowedToLogon is no longer available. Instead, use IWRdsProtocolConnection::IsUserAllowedToLogon.
     * @param {Integer} SessionId An integer that contains the session ID associated with the user.
     * @param {HANDLE_PTR} UserToken A pointer to the user token handle.
     * @param {PWSTR} pDomainName A pointer to a string that contains the domain name for the user.
     * @param {PWSTR} pUserName A pointer to a string that contains the user name.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-isuserallowedtologon
     */
    IsUserAllowedToLogon(SessionId, UserToken, pDomainName, pUserName) {
        pDomainName := pDomainName is String ? StrPtr(pDomainName) : pDomainName
        pUserName := pUserName is String ? StrPtr(pUserName) : pUserName

        result := ComCall(13, this, "uint", SessionId, "ptr", UserToken, "ptr", pDomainName, "ptr", pUserName, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnection::SessionArbitrationEnumeration is no longer available. Instead, use IWRdsProtocolConnection::SessionArbitrationEnumeration.
     * @remarks
     * 
     * The Remote Desktop Services service calls this method to find existing sessions that this user can reconnect to. If this method returns an <b>HRESULT</b> error code or it does not return any session IDs,  the Remote Desktop Services service performs arbitration itself.
     * 
     * 
     * @param {HANDLE_PTR} hUserToken A pointer to a user token handle.
     * @param {BOOL} bSingleSessionPerUserEnabled A Boolean value that specifies whether a user can be associated with, at most, one session.
     * @param {Pointer<Integer>} pdwSessionIdentifierCount A pointer to an integer that specifies the number of disconnected session IDs referenced by  the <i>pSessionIdArray</i> parameter.
     * @returns {Integer} A pointer to an array of integers that contains the disconnected session IDs for the user.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-sessionarbitrationenumeration
     */
    SessionArbitrationEnumeration(hUserToken, bSingleSessionPerUserEnabled, pdwSessionIdentifierCount) {
        pdwSessionIdentifierCountMarshal := pdwSessionIdentifierCount is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", hUserToken, "int", bSingleSessionPerUserEnabled, "uint*", &pSessionIdArray := 0, pdwSessionIdentifierCountMarshal, pdwSessionIdentifierCount, "HRESULT")
        return pSessionIdArray
    }

    /**
     * IWTSProtocolConnection::LogonNotify is no longer available. Instead, use IWRdsProtocolConnection::LogonNotify.
     * @remarks
     * 
     * The Remote Desktop Services service also calls this method when  the state of the session has changed.
     * 
     * This is an event notification and you should return immediately from this method. To avoid a possible deadlock, you should not make any function or method calls that will directly or indirectly result in a <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-api-functions">Remote Desktop Services API</a> being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
     * 
     * 
     * @param {HANDLE_PTR} hClientToken A pointer to a user token handle.
     * @param {PWSTR} wszUserName A pointer to a string that contains the user name.
     * @param {PWSTR} wszDomainName A pointer to a string that contains the domain name for the user.
     * @param {Pointer<WTS_SESSION_ID>} SessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WTS_SESSION_ID</a> structure that contains the session ID associated with the user.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-logonnotify
     */
    LogonNotify(hClientToken, wszUserName, wszDomainName, SessionId) {
        wszUserName := wszUserName is String ? StrPtr(wszUserName) : wszUserName
        wszDomainName := wszDomainName is String ? StrPtr(wszDomainName) : wszDomainName

        result := ComCall(15, this, "ptr", hClientToken, "ptr", wszUserName, "ptr", wszDomainName, "ptr", SessionId, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnection::GetUserData is no longer available. Instead, use IWRdsProtocolSettings::MergeSettings.
     * @remarks
     * 
     * The Remote Desktop Services service merges all policy data, including listener settings, client-provided data, and Group Policy data, before calling this method.
     * 
     * 
     * @param {Pointer<WTS_POLICY_DATA>} pPolicyData A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_policy_data">WTS_POLICY_DATA</a> structure that contains the merged Group Policy values.
     * @param {Pointer<WTS_USER_DATA>} pClientData A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_user_data">WTS_USER_DATA</a> structure that contains client property information.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getuserdata
     */
    GetUserData(pPolicyData, pClientData) {
        result := ComCall(16, this, "ptr", pPolicyData, "ptr", pClientData, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnection::DisconnectNotify is no longer available. Instead, use IWRdsProtocolConnection::DisconnectNotify.
     * @remarks
     * 
     * This is an event notification and you should return immediately from this method. To avoid a possible deadlock, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
     * 
     * 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-disconnectnotify
     */
    DisconnectNotify() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnection::Close is no longer available. Instead, use IWRdsProtocolConnection::Close.
     * @remarks
     * 
     *  The protocol should perform whatever cleanup is necessary to close the connection and delete the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocolconnectioncallback">IWTSProtocolConnectionCallback</a>  object.
     * 
     * 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-close
     */
    Close() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnection::GetProtocolStatus is no longer available. Instead, use IWRdsProtocolConnection::GetProtocolStatus.
     * @returns {WTS_PROTOCOL_STATUS} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_protocol_status">WTS_PROTOCOL_STATUS</a> structure that contains counter, signal, and cache information for the protocol.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getprotocolstatus
     */
    GetProtocolStatus() {
        pProtocolStatus := WTS_PROTOCOL_STATUS()
        result := ComCall(19, this, "ptr", pProtocolStatus, "HRESULT")
        return pProtocolStatus
    }

    /**
     * IWTSProtocolConnection::GetLastInputTime is no longer available. Instead, use IWRdsProtocolConnection::GetLastInputTime.
     * @returns {Integer} An integer that contains the elapsed time, in milliseconds.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getlastinputtime
     */
    GetLastInputTime() {
        result := ComCall(20, this, "uint*", &pLastInputTime := 0, "HRESULT")
        return pLastInputTime
    }

    /**
     * IWTSProtocolConnection::SetErrorInfo is no longer available. Instead, use IWRdsProtocolConnection::SetErrorInfo.
     * @param {Integer} ulError An integer that contains the error code.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-seterrorinfo
     */
    SetErrorInfo(ulError) {
        result := ComCall(21, this, "uint", ulError, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnection::SendBeep is no longer available.
     * @param {Integer} Frequency An integer that contains the pulse frequency ranging from 37 to 32,767 Hertz.
     * @param {Integer} Duration An integer that contains the pulse duration, in milliseconds.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-sendbeep
     */
    SendBeep(Frequency, Duration) {
        result := ComCall(22, this, "uint", Frequency, "uint", Duration, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolConnection::CreateVirtualChannel is no longer available. Instead, use IWRdsProtocolConnection::CreateVirtualChannel.
     * @remarks
     * 
     * Virtual channels are software extensions that can be created to enhance a Remote Desktop Services application. Examples include support for additional hardware or additions to the functionality provided by a given protocol. For more information, see <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-virtual-channels">Remote Desktop Services Virtual 
     *       Channels</a>.
     * 
     * 
     * @param {PSTR} szEndpointName A string value that contains the endpoint data that uniquely identifies the connection.
     * @param {BOOL} bStatic A Boolean value that specifies whether the virtual channel is static or dynamic. A value of <b>TRUE</b> specifies a static channel.
     * @param {Integer} RequestedPriority An integer that contains the priority.
     * @returns {Pointer} A pointer to the channel handle.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-createvirtualchannel
     */
    CreateVirtualChannel(szEndpointName, bStatic, RequestedPriority) {
        szEndpointName := szEndpointName is String ? StrPtr(szEndpointName) : szEndpointName

        result := ComCall(23, this, "ptr", szEndpointName, "int", bStatic, "uint", RequestedPriority, "ptr*", &phChannel := 0, "HRESULT")
        return phChannel
    }

    /**
     * IWTSProtocolConnection::QueryProperty is no longer available. Instead, use IWRdsProtocolConnection::QueryProperty.
     * @param {Guid} QueryType 
     * @param {Integer} ulNumEntriesIn An integer that contains the number of 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_property_value">WTS_PROPERTY_VALUE</a> structures passed in the 
     *        <i>pPropertyEntriesIn</i> argument.
     * @param {Integer} ulNumEntriesOut An integer that contains the number of 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_property_value">WTS_PROPERTY_VALUE</a> structures passed in the 
     *        <i>pPropertyEntriesOut</i> argument.
     * @param {Pointer<WTS_PROPERTY_VALUE>} pPropertyEntriesIn One or more <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_property_value">WTS_PROPERTY_VALUE</a> structures 
     *        that can be used to help find the requested property information.
     * @returns {WTS_PROPERTY_VALUE} One or more <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_property_value">WTS_PROPERTY_VALUE</a> structures 
     *        that contain the requested property information.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-queryproperty
     */
    QueryProperty(QueryType, ulNumEntriesIn, ulNumEntriesOut, pPropertyEntriesIn) {
        pPropertyEntriesOut := WTS_PROPERTY_VALUE()
        result := ComCall(24, this, "ptr", QueryType, "uint", ulNumEntriesIn, "uint", ulNumEntriesOut, "ptr", pPropertyEntriesIn, "ptr", pPropertyEntriesOut, "HRESULT")
        return pPropertyEntriesOut
    }

    /**
     * IWTSProtocolConnection::GetShadowConnection is no longer available. Instead, use IWRdsProtocolConnection::GetShadowConnection.
     * @returns {IWTSProtocolShadowConnection} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwtsprotocolshadowconnection">IWTSProtocolShadowConnection</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getshadowconnection
     */
    GetShadowConnection() {
        result := ComCall(25, this, "ptr*", &ppShadowConnection := 0, "HRESULT")
        return IWTSProtocolShadowConnection(ppShadowConnection)
    }
}
