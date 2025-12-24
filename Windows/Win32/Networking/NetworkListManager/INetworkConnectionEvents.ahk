#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The INetworkConnectionEvents interface is a message sink interface that a client implements to get network connection-related events. Applications that are interested in lower-level events (such as authentication changes) must implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-inetworkconnectionevents
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetworkConnectionEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkConnectionEvents
     * @type {Guid}
     */
    static IID => Guid("{dcb00007-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NetworkConnectionConnectivityChanged", "NetworkConnectionPropertyChanged"]

    /**
     * The NetworkConnectionConnectivityChanged method notifies a client when connectivity change events occur on a network connection level.
     * @param {Guid} connectionId A GUID that identifies the network connection  on which the event occurred.
     * @param {Integer} newConnectivity <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connectivity">NLM_CONNECTIVITY</a> enumeration value that specifies the new connectivity for this network connection.
     * @returns {HRESULT} Returns S_OK if the method succeeds.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkconnectionevents-networkconnectionconnectivitychanged
     */
    NetworkConnectionConnectivityChanged(connectionId, newConnectivity) {
        result := ComCall(3, this, "ptr", connectionId, "int", newConnectivity, "HRESULT")
        return result
    }

    /**
     * The NetworkConnectionPropertyChanged method notifies a client when property change events related to a specific network connection occur.
     * @param {Guid} connectionId A GUID that identifies the network connection  on which the event occurred.
     * @param {Integer} flags The <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connection_property_change">NLM_CONNECTION_PROPERTY_CHANGE</a> flags for this connection.
     * @returns {HRESULT} Returns S_OK if the method succeeds.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkconnectionevents-networkconnectionpropertychanged
     */
    NetworkConnectionPropertyChanged(connectionId, flags) {
        result := ComCall(4, this, "ptr", connectionId, "int", flags, "HRESULT")
        return result
    }
}
