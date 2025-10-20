#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} Flags 
     * @param {Pointer<IEnumNetworks>} ppEnumNetwork 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanager-getnetworks
     */
    GetNetworks(Flags, ppEnumNetwork) {
        result := ComCall(7, this, "int", Flags, "ptr*", ppEnumNetwork, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} gdNetworkId 
     * @param {Pointer<INetwork>} ppNetwork 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanager-getnetwork
     */
    GetNetwork(gdNetworkId, ppNetwork) {
        result := ComCall(8, this, "ptr", gdNetworkId, "ptr*", ppNetwork, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumNetworkConnections>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanager-getnetworkconnections
     */
    GetNetworkConnections(ppEnum) {
        result := ComCall(9, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} gdNetworkConnectionId 
     * @param {Pointer<INetworkConnection>} ppNetworkConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanager-getnetworkconnection
     */
    GetNetworkConnection(gdNetworkConnectionId, ppNetworkConnection) {
        result := ComCall(10, this, "ptr", gdNetworkConnectionId, "ptr*", ppNetworkConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIsConnected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanager-get_isconnectedtointernet
     */
    get_IsConnectedToInternet(pbIsConnected) {
        result := ComCall(11, this, "ptr", pbIsConnected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIsConnected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanager-get_isconnected
     */
    get_IsConnected(pbIsConnected) {
        result := ComCall(12, this, "ptr", pbIsConnected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pConnectivity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanager-getconnectivity
     */
    GetConnectivity(pConnectivity) {
        result := ComCall(13, this, "int*", pConnectivity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<NLM_SIMULATED_PROFILE_INFO>} pSimulatedInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanager-setsimulatedprofileinfo
     */
    SetSimulatedProfileInfo(pSimulatedInfo) {
        result := ComCall(14, this, "ptr", pSimulatedInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanager-clearsimulatedprofileinfo
     */
    ClearSimulatedProfileInfo() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
