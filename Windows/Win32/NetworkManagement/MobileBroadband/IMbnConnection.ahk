#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the network connectivity of a device.
 * @remarks
 * This interface is only available when a Mobile Broadband device is registered to a network or when the device is in <b>MBN_READY_STATE_DEVICE_LOCKED</b> state. When a device deregisters from the network this COM interface is removed and the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionmanagerevents-onconnectionremoval">OnConnectionRemoval</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionmanagerevents">IMbnConnectionManagerEvents</a> interface.
 * 
 * <b>IMbnConnection</b> objects are provided by calls to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionmanager-getconnection">GetConnection</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionmanager-getconnections">GetConnections</a> methods of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionmanager">IMbnConnectionManager</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nn-mbnapi-imbnconnection
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnConnection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnConnection
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-200d-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ConnectionID", "get_InterfaceID", "Connect", "Disconnect", "GetConnectionState", "GetVoiceCallState", "GetActivationNetworkError"]

    /**
     * @type {BSTR} 
     */
    ConnectionID {
        get => this.get_ConnectionID()
    }

    /**
     * @type {BSTR} 
     */
    InterfaceID {
        get => this.get_InterfaceID()
    }

    /**
     * Gets the unique identifier for the connection.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnconnection-get_connectionid
     */
    get_ConnectionID() {
        ConnectionID := BSTR()
        result := ComCall(3, this, "ptr", ConnectionID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ConnectionID
    }

    /**
     * Gets the interface identifier.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnconnection-get_interfaceid
     */
    get_InterfaceID() {
        InterfaceID := BSTR()
        result := ComCall(4, this, "ptr", InterfaceID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InterfaceID
    }

    /**
     * Establishes a data connection.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">Connect</a> method is used to activate a connection context for the device. The Mobile Broadband service currently supports at most one active context. Activation of the context will also result in L2 connection also being established. Similarly, deactivation of a context will result in disconnection of the physical data connection to the mobile network.
     * 
     * If the device is not in the packet-attached state at the time of calling this operation then the Mobile Broadband service will implicitly packet attach the device before issuing the connect request to the device. If there is any packet service state change then application will be notified by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistrationevents-onpacketservicestatechange">OnPacketServiceStateChange</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistrationevents">IMbnRegistrationEvents</a> interface.
     * 
     * If <i>connectionMode</i> is set to <b>MBN_CONNECTION_MODE_PROFILE</b>, then <i>strProfile</i> represents the name of the profile for the device. If set to <b>MBN_CONNECTION_MODE_TMP_PROFILE</b>, then <i>strProfile</i> represents the XML representation of the profile. A calling application can use <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionprofilemanager">IMbnConnectionProfileManager</a> to get a list of connection profiles stored in the device.
     * 
     * 
     * This is an asynchronous operation that will return immediately. If this method returns successfully, then the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionevents-onconnectcomplete">OnConnectComplete</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionevents">IMbnConnectionEvents</a> when the operation is complete.
     * 
     * 
     * Windows 8 and later versions of Windows: A Windows Store app may use <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">Connect</a> with only the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_connection_mode">MBN_CONNECTION_MODE_TMP_PROFILE</a><i>connectionMode</i> and the <i>strProfile</i> parameter set to an XML representation of the profile. This implies that the connection is of a temporary nature and not saved for future use by the system.
     * @param {Integer} connectionMode An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_connection_mode">MBN_CONNECTION_MODE</a> value that specifies the mode of the connection.
     * @param {PWSTR} strProfile Contains the profile designator.
     * @returns {Integer} A pointer to a unique request ID returned by the Mobile Broadband service to identify this asynchronous request.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnconnection-connect
     */
    Connect(connectionMode, strProfile) {
        strProfile := strProfile is String ? StrPtr(strProfile) : strProfile

        result := ComCall(5, this, "int", connectionMode, "ptr", strProfile, "uint*", &requestID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return requestID
    }

    /**
     * Disconnects a data connection.
     * @remarks
     * Deactivation will also result in the disconnection of the L2 connection.
     * 
     * This is an asynchronous operation that will return immediately. If this method returns successfully, then the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionevents-ondisconnectcomplete">OnDisconnectComplete</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionevents">IMbnConnectionEvents</a> when the operation is complete.
     * 
     * Windows 8 and later versions of Windows: A Windows Store app may only use <b>Disconnect</b> if the existing MBN connection was initiated by that app using <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">Connect</a>. <b>Disconnect</b> may not be used to disconnect connections that have been made by the user or by the <a href="https://docs.microsoft.com/windows/desktop/wcm/windows-connection-manager-portal">Windows Connection Manager</a>.
     * @returns {Integer} A pointer to a unique request ID assigned by the Mobile Broadband service to identify this asynchronous request.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnconnection-disconnect
     */
    Disconnect() {
        result := ComCall(6, this, "uint*", &requestID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return requestID
    }

    /**
     * Gets the current connection state of the device.
     * @remarks
     * This method can return S_OK when <i>ProfileName</i> is <b>NULL</b>. Make sure that your client is capable of handling a <b>NULL</b><i>ProfileName</i> even if the call is successful.
     * @param {Pointer<Integer>} ConnectionState A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_activation_state">MBN_ACTIVATION_STATE</a> structure  that contains the state of the connection.
     * @param {Pointer<BSTR>} ProfileName A pointer to a string that contains the name of the connection profile.  This parameter is valid only when <i>ConnectionState</i> is <b>MBN_ACTIVATION_STATE_ACTIVATED</b>.  When this string is not <b>NULL</b>, the calling application must free this string by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * <div class="alert"><b>Note</b>  This method can return S_OK when <i>ProfileName</i> is <b>NULL</b>. Make sure that your client is capable of handling a <b>NULL</b> <i>ProfileName</i> even if the call is successful.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The activation state not available.  The Mobile Broadband service is probing the device for the information.  The calling application can be notified when the activation state is available by registering for the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionevents-onconnectstatechange">OnConnectStateChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionevents">IMbnConnectionEvents</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_MBN_PIN_REQUIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A PIN is required to get the call state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_MBN_SIM_NOT_INSERTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A SIM is not inserted in the device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_MBN_BAD_SIM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A bad SIM is inserted in the device.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnconnection-getconnectionstate
     */
    GetConnectionState(ConnectionState, ProfileName) {
        ConnectionStateMarshal := ConnectionState is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, ConnectionStateMarshal, ConnectionState, "ptr", ProfileName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the voice call state of the device.
     * @remarks
     * For the recoverable errors <b>E_MBN_PIN_REQUIRED</b>, <b>E_MBN_SIM_NOT_INSERTED</b>, and <b>E_MBN_BAD_SIM</b>,  the Mobile Broadband service will query the device again for this information once the error condition is over. For example, if the device required a PIN to be entered to retrieve the voice call state, then <b>E_MBN_PIN_REQUIRED</b> is returned. After the calling application enters the PIN to unlock the device, the Mobile Broadband service will again try to get the voice call state from the device. The Mobile Broadband service will update the application with the status of a new probe by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionevents-onvoicecallstatechange">OnVoiceCallStateChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionevents">IMbnConnectionEvents</a>.
     * @returns {Integer} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_voice_call_state">MBN_VOICE_CALL_STATE</a> value that specifies the voice call state.  If the method returns anything other than <b>S_OK</b>, the contents of this pointer are not set.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnconnection-getvoicecallstate
     */
    GetVoiceCallState() {
        result := ComCall(8, this, "int*", &voiceCallState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return voiceCallState
    }

    /**
     * Gets the network error returned in a Packet Data Protocol (PDP) context activation failure.
     * @remarks
     * For GSM devices these error codes are defined in 3GPP specification 24.008 as cause codes. For CDMA devices, device and network specific error codes are used.
     * 
     * The error codes are cleared when the context activation operation completes successfully. When there is no network error or the error is not known, then the value is set to 0.
     * 
     * Whenever there is a change in the network error value, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionevents-onconnectstatechange">OnConnectStateChange</a> member of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionevents">IMbnConnectionEvents</a>.
     * @returns {Integer} The error code returned by the network from the last connection context activation operation.  The value is meaningful only if the method returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnconnection-getactivationnetworkerror
     */
    GetActivationNetworkError() {
        result := ComCall(9, this, "uint*", &networkError := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return networkError
    }
}
