#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the network connectivity of a device.
 * @remarks
 * 
 * This interface is only available when a Mobile Broadband device is registered to a network or when the device is in <b>MBN_READY_STATE_DEVICE_LOCKED</b> state. When a device deregisters from the network this COM interface is removed and the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionmanagerevents-onconnectionremoval">OnConnectionRemoval</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionmanagerevents">IMbnConnectionManagerEvents</a> interface.
 * 
 * <b>IMbnConnection</b> objects are provided by calls to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionmanager-getconnection">GetConnection</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionmanager-getconnections">GetConnections</a> methods of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionmanager">IMbnConnectionManager</a> interface.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnconnection
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
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnection-get_connectionid
     */
    get_ConnectionID() {
        ConnectionID := BSTR()
        result := ComCall(3, this, "ptr", ConnectionID, "HRESULT")
        return ConnectionID
    }

    /**
     * Gets the interface identifier.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnection-get_interfaceid
     */
    get_InterfaceID() {
        InterfaceID := BSTR()
        result := ComCall(4, this, "ptr", InterfaceID, "HRESULT")
        return InterfaceID
    }

    /**
     * Establishes a data connection.
     * @param {Integer} connectionMode An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_connection_mode">MBN_CONNECTION_MODE</a> value that specifies the mode of the connection.
     * @param {PWSTR} strProfile Contains the profile designator.
     * @returns {Integer} A pointer to a unique request ID returned by the Mobile Broadband service to identify this asynchronous request.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnection-connect
     */
    Connect(connectionMode, strProfile) {
        strProfile := strProfile is String ? StrPtr(strProfile) : strProfile

        result := ComCall(5, this, "int", connectionMode, "ptr", strProfile, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Disconnects a data connection.
     * @returns {Integer} A pointer to a unique request ID assigned by the Mobile Broadband service to identify this asynchronous request.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnection-disconnect
     */
    Disconnect() {
        result := ComCall(6, this, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Gets the current connection state of the device.
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
     * The activation state not available.  The Mobile Broadband service is probing the device for the information.  The calling application can be notified when the activation state is available by registering for the <a href="/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionevents-onconnectstatechange">OnConnectStateChange</a> method of <a href="/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionevents">IMbnConnectionEvents</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnection-getconnectionstate
     */
    GetConnectionState(ConnectionState, ProfileName) {
        ConnectionStateMarshal := ConnectionState is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, ConnectionStateMarshal, ConnectionState, "ptr", ProfileName, "HRESULT")
        return result
    }

    /**
     * Gets the voice call state of the device.
     * @returns {Integer} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_voice_call_state">MBN_VOICE_CALL_STATE</a> value that specifies the voice call state.  If the method returns anything other than <b>S_OK</b>, the contents of this pointer are not set.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnection-getvoicecallstate
     */
    GetVoiceCallState() {
        result := ComCall(8, this, "int*", &voiceCallState := 0, "HRESULT")
        return voiceCallState
    }

    /**
     * Gets the network error returned in a Packet Data Protocol (PDP) context activation failure.
     * @returns {Integer} The error code returned by the network from the last connection context activation operation.  The value is meaningful only if the method returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnection-getactivationnetworkerror
     */
    GetActivationNetworkError() {
        result := ComCall(9, this, "uint*", &networkError := 0, "HRESULT")
        return networkError
    }
}
