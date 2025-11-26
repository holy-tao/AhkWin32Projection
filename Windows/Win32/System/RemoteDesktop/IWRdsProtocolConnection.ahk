#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWRdsProtocolLogonErrorRedirector.ahk
#Include .\WTS_CLIENT_DATA.ahk
#Include .\WTS_USER_CREDENTIAL.ahk
#Include .\IWRdsProtocolLicenseConnection.ahk
#Include .\WTS_SESSION_ID.ahk
#Include .\WTS_PROTOCOL_STATUS.ahk
#Include .\WTS_PROPERTY_VALUE.ahk
#Include .\IWRdsProtocolShadowConnection.ahk
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
     * Retrieves an IWRdsProtocolLogonErrorRedirector interface that specifies how the protocol should handle client logon errors.
     * @returns {IWRdsProtocolLogonErrorRedirector} Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocollogonerrorredirector">IWRdsProtocolLogonErrorRedirector</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getlogonerrorredirector
     */
    GetLogonErrorRedirector() {
        result := ComCall(3, this, "ptr*", &ppLogonErrorRedir := 0, "HRESULT")
        return IWRdsProtocolLogonErrorRedirector(ppLogonErrorRedir)
    }

    /**
     * Directs the protocol to continue with the connection request.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * Upon receiving an error, the Remote Desktop Services service will drop the connection.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-acceptconnection
     */
    AcceptConnection() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Requests client settings from the protocol.
     * @returns {WTS_CLIENT_DATA} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_client_data">WRDS_CLIENT_DATA</a> structure that contains the client settings.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getclientdata
     */
    GetClientData() {
        pClientData := WTS_CLIENT_DATA()
        result := ComCall(5, this, "ptr", pClientData, "HRESULT")
        return pClientData
    }

    /**
     * Retrieves the number of monitors and the primary monitor number on the client.
     * @param {Pointer<Integer>} pNumMonitors A pointer to a <b>UINT</b> variable to receive the number of monitors counted.
     * @param {Pointer<Integer>} pPrimaryMonitor A pointer to a <b>UINT</b> variable to receive the number of the primary monitor on the client.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getclientmonitordata
     */
    GetClientMonitorData(pNumMonitors, pPrimaryMonitor) {
        pNumMonitorsMarshal := pNumMonitors is VarRef ? "uint*" : "ptr"
        pPrimaryMonitorMarshal := pPrimaryMonitor is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pNumMonitorsMarshal, pNumMonitors, pPrimaryMonitorMarshal, pPrimaryMonitor, "HRESULT")
        return result
    }

    /**
     * Returns user credentials.
     * @returns {WTS_USER_CREDENTIAL} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_user_credential">WRDS_USER_CREDENTIAL</a> structure that contains the credentials. Currently, only the user name, password, and domain are supported. The user name and password are plaintext.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getusercredentials
     */
    GetUserCredentials() {
        pUserCreds := WTS_USER_CREDENTIAL()
        result := ComCall(7, this, "ptr", pUserCreds, "HRESULT")
        return pUserCreds
    }

    /**
     * Retrieves an IWRdsProtocolLicenseConnection object that is used to begin the client licensing process.
     * @returns {IWRdsProtocolLicenseConnection} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocollicenseconnection">IWRdsProtocolLicenseConnection</a> interface the receives the license connection object.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getlicenseconnection
     */
    GetLicenseConnection() {
        result := ComCall(8, this, "ptr*", &ppLicenseConnection := 0, "HRESULT")
        return IWRdsProtocolLicenseConnection(ppLicenseConnection)
    }

    /**
     * Specifies a session that the connection should be reconnected to.
     * @returns {WTS_SESSION_ID} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WRDS_SESSION_ID</a> structure that uniquely identifies the session.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-authenticateclienttosession
     */
    AuthenticateClientToSession() {
        SessionId := WTS_SESSION_ID()
        result := ComCall(9, this, "ptr", SessionId, "HRESULT")
        return SessionId
    }

    /**
     * Sends the identifier of the new session to the protocol.
     * @param {Pointer<WTS_SESSION_ID>} SessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WRDS_SESSION_ID</a> structure that uniquely identifies the session.
     * @param {HANDLE_PTR} SessionHandle The session handle.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-notifysessionid
     */
    NotifySessionId(SessionId, SessionHandle) {
        result := ComCall(10, this, "ptr", SessionId, "ptr", SessionHandle, "HRESULT")
        return result
    }

    /**
     * Obtains the handles to input/output devices for the protocol.
     * @param {Pointer<HANDLE_PTR>} pKeyboardHandle A pointer to a handle that receives the handle of the keyboard device. This is a handle to an <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/index">I8042prt keyboard driver</a>.
     * @param {Pointer<HANDLE_PTR>} pMouseHandle A pointer to a handle that receives the handle of the mouse device. This is a handle to a <a href="https://docs.microsoft.com/previous-versions/ff542367(v=vs.85)">Mouclass driver</a>.
     * @param {Pointer<HANDLE_PTR>} pBeepHandle A pointer to a handle that receives the handle of the beep or sound device. This handle is not used and must be set to <b>NULL</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getinputhandles
     */
    GetInputHandles(pKeyboardHandle, pMouseHandle, pBeepHandle) {
        pKeyboardHandleMarshal := pKeyboardHandle is VarRef ? "ptr*" : "ptr"
        pMouseHandleMarshal := pMouseHandle is VarRef ? "ptr*" : "ptr"
        pBeepHandleMarshal := pBeepHandle is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, pKeyboardHandleMarshal, pKeyboardHandle, pMouseHandleMarshal, pMouseHandle, pBeepHandleMarshal, pBeepHandle, "HRESULT")
        return result
    }

    /**
     * Obtains the handle of the video device for the protocol.
     * @returns {HANDLE_PTR} A pointer to a handle that receives the handle of the video device.
     * 
     * If the protocol object is using the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsremotefxgraphicsconnection">IWRdsRemoteFXGraphicsConnection</a>  interface, this method should set the contents of <i>pVideoHandle</i> to <b>NULL</b> and return <b>E_NOTIMPL</b>.
     * 
     * If the protocol is not using the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsremotefxgraphicsconnection">IWRdsRemoteFXGraphicsConnection</a> interface, this method should return a handle to the video miniport driver for the remote session associated with the protocol.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getvideohandle
     */
    GetVideoHandle() {
        result := ComCall(12, this, "ptr*", &pVideoHandle := 0, "HRESULT")
        return pVideoHandle
    }

    /**
     * Signals the protocol that the session has been initialized.
     * @param {Integer} SessionId The session identifier.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-connectnotify
     */
    ConnectNotify(SessionId) {
        result := ComCall(13, this, "uint", SessionId, "HRESULT")
        return result
    }

    /**
     * Determines from the protocol whether a user is allowed to log on to a session.
     * @param {Integer} SessionId The session identifier.
     * @param {HANDLE_PTR} UserToken A handle that represents the user token.
     * @param {PWSTR} pDomainName A pointer to a null-terminated string that contains the user's domain name.
     * @param {PWSTR} pUserName A pointer to a null-terminated string that contains the user name.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-isuserallowedtologon
     */
    IsUserAllowedToLogon(SessionId, UserToken, pDomainName, pUserName) {
        pDomainName := pDomainName is String ? StrPtr(pDomainName) : pDomainName
        pUserName := pUserName is String ? StrPtr(pUserName) : pUserName

        result := ComCall(14, this, "uint", SessionId, "ptr", UserToken, "ptr", pDomainName, "ptr", pUserName, "HRESULT")
        return result
    }

    /**
     * Called after arbitration to allow the protocol to specify the sessions to be reconnected.
     * @param {HANDLE_PTR} hUserToken A handle that represents the user token.
     * @param {BOOL} bSingleSessionPerUserEnabled Specifies whether a user can only be associated with a single session.
     * @param {Pointer<Integer>} pdwSessionIdentifierCount A pointer to a <b>ULONG</b> value that receives the number of elements in the <i>pSessionIdArray</i> array.
     * @returns {Integer} A pointer to a <b>ULONG</b> array that receives the disconnected session identifiers for the user. If this parameter is <b>NULL</b>, the Remote Desktop Services service is requesting the number of elements to allocate this array. Place the number of identifiers in the value pointed to by <i>pdwSessionIdentifierCount</i>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-sessionarbitrationenumeration
     */
    SessionArbitrationEnumeration(hUserToken, bSingleSessionPerUserEnabled, pdwSessionIdentifierCount) {
        pdwSessionIdentifierCountMarshal := pdwSessionIdentifierCount is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "ptr", hUserToken, "int", bSingleSessionPerUserEnabled, "uint*", &pSessionIdArray := 0, pdwSessionIdentifierCountMarshal, pdwSessionIdentifierCount, "HRESULT")
        return pSessionIdArray
    }

    /**
     * Called when the user has logged on to the session.
     * @param {HANDLE_PTR} hClientToken A handle that represents the user token.
     * @param {PWSTR} wszUserName A pointer to a null-terminated string that contains the user name.
     * @param {PWSTR} wszDomainName A pointer to a null-terminated string that contains the user's domain name.
     * @param {Pointer<WTS_SESSION_ID>} SessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_session_id">WRDS_SESSION_ID</a> structure that uniquely identifies the session.
     * @param {Pointer<WRDS_CONNECTION_SETTINGS>} pWRdsConnectionSettings A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_connection_settings">WRDS_CONNECTION_SETTINGS</a> structure that contains connection settings for the session.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-logonnotify
     */
    LogonNotify(hClientToken, wszUserName, wszDomainName, SessionId, pWRdsConnectionSettings) {
        wszUserName := wszUserName is String ? StrPtr(wszUserName) : wszUserName
        wszDomainName := wszDomainName is String ? StrPtr(wszDomainName) : wszDomainName

        result := ComCall(16, this, "ptr", hClientToken, "ptr", wszUserName, "ptr", wszDomainName, "ptr", SessionId, "ptr", pWRdsConnectionSettings, "HRESULT")
        return result
    }

    /**
     * Notifies the protocol that the session is about to be disconnected.
     * @param {Integer} DisconnectReason A numeric value that indicates the reason for the disconnection.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-predisconnect
     */
    PreDisconnect(DisconnectReason) {
        result := ComCall(17, this, "uint", DisconnectReason, "HRESULT")
        return result
    }

    /**
     * Notifies the protocol that the session has been disconnected.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-disconnectnotify
     */
    DisconnectNotify() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Closes a connection after the session is disconnected.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-close
     */
    Close() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * Retrieves information about the protocol status.
     * @returns {WTS_PROTOCOL_STATUS} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_protocol_status">WRDS_PROTOCOL_STATUS</a> structure that receives counter, signal, and cache information for the protocol.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getprotocolstatus
     */
    GetProtocolStatus() {
        pProtocolStatus := WTS_PROTOCOL_STATUS()
        result := ComCall(20, this, "ptr", pProtocolStatus, "HRESULT")
        return pProtocolStatus
    }

    /**
     * Retrieves the last time the protocol received user input.
     * @returns {Integer} A pointer to a <b>ULONG64</b> value that receives the number of milliseconds that has elapsed since the protocol last received input.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getlastinputtime
     */
    GetLastInputTime() {
        result := ComCall(21, this, "uint*", &pLastInputTime := 0, "HRESULT")
        return pLastInputTime
    }

    /**
     * Sets error information in the protocol.
     * @param {Integer} ulError The error code.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-seterrorinfo
     */
    SetErrorInfo(ulError) {
        result := ComCall(22, this, "uint", ulError, "HRESULT")
        return result
    }

    /**
     * Requests that the protocol create a virtual channel.
     * @param {PSTR} szEndpointName A null-terminated string that contains the endpoint data that uniquely identifies the connection.
     * @param {BOOL} bStatic Specifies whether the virtual channel is static or dynamic.
     * @param {Integer} RequestedPriority Specifies the requested priority for the channel.
     * @returns {Pointer} A pointer to a <b>ULONG</b> value that receives the handle for the channel created.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-createvirtualchannel
     */
    CreateVirtualChannel(szEndpointName, bStatic, RequestedPriority) {
        szEndpointName := szEndpointName is String ? StrPtr(szEndpointName) : szEndpointName

        result := ComCall(23, this, "ptr", szEndpointName, "int", bStatic, "uint", RequestedPriority, "ptr*", &phChannel := 0, "HRESULT")
        return phChannel
    }

    /**
     * Retrieves a property value from the protocol.
     * @param {Guid} QueryType 
     * @param {Integer} ulNumEntriesIn The number of entries in the <i>pPropertyEntriesIn</i> array.
     * @param {Integer} ulNumEntriesOut The number of entries in the <i>pPropertyEntriesOut</i> array.
     * @param {Pointer<WTS_PROPERTY_VALUE>} pPropertyEntriesIn An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_property_value">WRDS_PROPERTY_VALUE</a> structures that can be used to help find the requested property information.
     * @returns {WTS_PROPERTY_VALUE} An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_property_value">WRDS_PROPERTY_VALUE</a> structures that receive the requested property values.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-queryproperty
     */
    QueryProperty(QueryType, ulNumEntriesIn, ulNumEntriesOut, pPropertyEntriesIn) {
        pPropertyEntriesOut := WTS_PROPERTY_VALUE()
        result := ComCall(24, this, "ptr", QueryType, "uint", ulNumEntriesIn, "uint", ulNumEntriesOut, "ptr", pPropertyEntriesIn, "ptr", pPropertyEntriesOut, "HRESULT")
        return pPropertyEntriesOut
    }

    /**
     * Retrieves a reference to the shadow connection object from the protocol.
     * @returns {IWRdsProtocolShadowConnection} The address of <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocolshadowconnection">IWRdsProtocolShadowConnection</a> interface pointer that receives the reference to the shadow connection object. This method must add a reference to the object before returning. When the Remote Desktop Services service no longer needs the object, it will release it.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-getshadowconnection
     */
    GetShadowConnection() {
        result := ComCall(25, this, "ptr*", &ppShadowConnection := 0, "HRESULT")
        return IWRdsProtocolShadowConnection(ppShadowConnection)
    }

    /**
     * Notifies the protocol that the Winlogon.exe process has been created and initialized.
     * @param {Integer} SessionId The session identifier.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolconnection-notifycommandprocesscreated
     */
    NotifyCommandProcessCreated(SessionId) {
        result := ComCall(26, this, "uint", SessionId, "HRESULT")
        return result
    }
}
