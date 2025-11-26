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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnection-get_connectionid
     */
    get_ConnectionID() {
        ConnectionID := BSTR()
        result := ComCall(3, this, "ptr", ConnectionID, "HRESULT")
        return ConnectionID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnection-get_interfaceid
     */
    get_InterfaceID() {
        InterfaceID := BSTR()
        result := ComCall(4, this, "ptr", InterfaceID, "HRESULT")
        return InterfaceID
    }

    /**
     * 
     * @param {Integer} connectionMode 
     * @param {PWSTR} strProfile 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnection-connect
     */
    Connect(connectionMode, strProfile) {
        strProfile := strProfile is String ? StrPtr(strProfile) : strProfile

        result := ComCall(5, this, "int", connectionMode, "ptr", strProfile, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnection-disconnect
     */
    Disconnect() {
        result := ComCall(6, this, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @param {Pointer<Integer>} ConnectionState 
     * @param {Pointer<BSTR>} ProfileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnection-getconnectionstate
     */
    GetConnectionState(ConnectionState, ProfileName) {
        ConnectionStateMarshal := ConnectionState is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, ConnectionStateMarshal, ConnectionState, "ptr", ProfileName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnection-getvoicecallstate
     */
    GetVoiceCallState() {
        result := ComCall(8, this, "int*", &voiceCallState := 0, "HRESULT")
        return voiceCallState
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnection-getactivationnetworkerror
     */
    GetActivationNetworkError() {
        result := ComCall(9, this, "uint*", &networkError := 0, "HRESULT")
        return networkError
    }
}
