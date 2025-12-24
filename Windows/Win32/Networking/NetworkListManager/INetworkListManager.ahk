#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumNetworks.ahk
#Include .\INetwork.ahk
#Include .\IEnumNetworkConnections.ahk
#Include .\INetworkConnection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetworkListManager interface provides a set of methods to perform network list management functions.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-inetworklistmanager
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetworkListManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkListManager
     * @type {Guid}
     */
    static IID => Guid("{dcb00000-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The class identifier for NetworkListManager
     * @type {Guid}
     */
    static CLSID => Guid("{dcb00c01-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNetworks", "GetNetwork", "GetNetworkConnections", "GetNetworkConnection", "get_IsConnectedToInternet", "get_IsConnected", "GetConnectivity", "SetSimulatedProfileInfo", "ClearSimulatedProfileInfo"]

    /**
     * @type {VARIANT_BOOL} 
     */
    IsConnectedToInternet {
        get => this.get_IsConnectedToInternet()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsConnected {
        get => this.get_IsConnected()
    }

    /**
     * The GetNetworks method retrieves the list of networks available on the local machine.
     * @param {Integer} Flags <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_enum_network">NLM_ENUM_NETWORK</a> enumeration value that specifies the flags for the network (specifically, connected or not connected).
     * @returns {IEnumNetworks} Pointer to a pointer that receives an <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/nn-netlistmgr-ienumnetworks">IEnumNetworks</a> interface instance that contains the enumerator for the list of available networks.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworklistmanager-getnetworks
     */
    GetNetworks(Flags) {
        result := ComCall(7, this, "int", Flags, "ptr*", &ppEnumNetwork := 0, "HRESULT")
        return IEnumNetworks(ppEnumNetwork)
    }

    /**
     * The GetNetwork method retrieves a network based on a supplied network ID.
     * @param {Guid} gdNetworkId GUID that specifies the network ID.
     * @returns {INetwork} Pointer to a pointer that receives the <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/nn-netlistmgr-inetwork">INetwork</a> interface instance for this network.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworklistmanager-getnetwork
     */
    GetNetwork(gdNetworkId) {
        result := ComCall(8, this, "ptr", gdNetworkId, "ptr*", &ppNetwork := 0, "HRESULT")
        return INetwork(ppNetwork)
    }

    /**
     * The GetNetworkConnections method enumerates a complete list of the network connections that have been made.
     * @returns {IEnumNetworkConnections} Pointer to a pointer that receives an <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/nn-netlistmgr-ienumnetworkconnections">IEnumNetworkConnections</a> interface instance that enumerates all network connections on the machine.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworklistmanager-getnetworkconnections
     */
    GetNetworkConnections() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumNetworkConnections(ppEnum)
    }

    /**
     * The GetNetworkConnection method retrieves a network based on a supplied Network Connection ID.
     * @param {Guid} gdNetworkConnectionId A <b>GUID</b> that specifies the Network Connection ID.
     * @returns {INetworkConnection} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/nn-netlistmgr-inetworkconnection">INetworkConnection</a> object associated with the supplied <i>gdNetworkConnectionId</i>.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworklistmanager-getnetworkconnection
     */
    GetNetworkConnection(gdNetworkConnectionId) {
        result := ComCall(10, this, "ptr", gdNetworkConnectionId, "ptr*", &ppNetworkConnection := 0, "HRESULT")
        return INetworkConnection(ppNetworkConnection)
    }

    /**
     * The get_IsConnectedToInternet property specifies if the local machine has internet connectivity.
     * @returns {VARIANT_BOOL} If <b>TRUE</b>, the local machine is connected to the internet; if <b>FALSE</b>, it is not.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworklistmanager-get_isconnectedtointernet
     */
    get_IsConnectedToInternet() {
        result := ComCall(11, this, "short*", &pbIsConnected := 0, "HRESULT")
        return pbIsConnected
    }

    /**
     * The get_IsConnected property specifies if the local machine has network connectivity.
     * @returns {VARIANT_BOOL} If <b>TRUE</b> ,  the network has at least local connectivity via ipv4 or ipv6 or both. The network may also have internet connectivity.  Thus, the network is connected.
     * 
     * If <b>FALSE</b>, the network does not have local or internet connectivity. The network is not connected.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworklistmanager-get_isconnected
     */
    get_IsConnected() {
        result := ComCall(12, this, "short*", &pbIsConnected := 0, "HRESULT")
        return pbIsConnected
    }

    /**
     * The GetConnectivity method returns the overall connectivity state of the machine.
     * @returns {Integer} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connectivity">NLM_CONNECTIVITY</a> enumeration value that contains a bitmask that specifies the network connectivity of this machine.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworklistmanager-getconnectivity
     */
    GetConnectivity() {
        result := ComCall(13, this, "int*", &pConnectivity := 0, "HRESULT")
        return pConnectivity
    }

    /**
     * The SetSimulatedProfileInfo method applies a specific set of connection profile values to the internet connection profile in support of the simulation of specific metered internet connection conditions.
     * @param {Pointer<NLM_SIMULATED_PROFILE_INFO>} pSimulatedInfo Specific connection profile values to simulate on the current internet connection profile  when calling <a href="https://docs.microsoft.com/uwp/api/windows.networking.connectivity.networkinformation.getinternetconnectionprofile">GetInternetConnectionProfile</a> from an RDP Child Session
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworklistmanager-setsimulatedprofileinfo
     */
    SetSimulatedProfileInfo(pSimulatedInfo) {
        result := ComCall(14, this, "ptr", pSimulatedInfo, "HRESULT")
        return result
    }

    /**
     * Clears the connection profile values previously applied to the internet connection profile by SetSimulatedProfileInfo. The next internet connection query, via GetInternetConnectionProfile, will use system information.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworklistmanager-clearsimulatedprofileinfo
     */
    ClearSimulatedProfileInfo() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
