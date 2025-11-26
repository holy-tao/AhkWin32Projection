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
     * 
     * @param {Integer} Flags 
     * @returns {IEnumNetworks} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanager-getnetworks
     */
    GetNetworks(Flags) {
        result := ComCall(7, this, "int", Flags, "ptr*", &ppEnumNetwork := 0, "HRESULT")
        return IEnumNetworks(ppEnumNetwork)
    }

    /**
     * 
     * @param {Guid} gdNetworkId 
     * @returns {INetwork} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanager-getnetwork
     */
    GetNetwork(gdNetworkId) {
        result := ComCall(8, this, "ptr", gdNetworkId, "ptr*", &ppNetwork := 0, "HRESULT")
        return INetwork(ppNetwork)
    }

    /**
     * 
     * @returns {IEnumNetworkConnections} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanager-getnetworkconnections
     */
    GetNetworkConnections() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumNetworkConnections(ppEnum)
    }

    /**
     * 
     * @param {Guid} gdNetworkConnectionId 
     * @returns {INetworkConnection} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanager-getnetworkconnection
     */
    GetNetworkConnection(gdNetworkConnectionId) {
        result := ComCall(10, this, "ptr", gdNetworkConnectionId, "ptr*", &ppNetworkConnection := 0, "HRESULT")
        return INetworkConnection(ppNetworkConnection)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanager-get_isconnectedtointernet
     */
    get_IsConnectedToInternet() {
        result := ComCall(11, this, "short*", &pbIsConnected := 0, "HRESULT")
        return pbIsConnected
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanager-get_isconnected
     */
    get_IsConnected() {
        result := ComCall(12, this, "short*", &pbIsConnected := 0, "HRESULT")
        return pbIsConnected
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworklistmanager-getconnectivity
     */
    GetConnectivity() {
        result := ComCall(13, this, "int*", &pConnectivity := 0, "HRESULT")
        return pConnectivity
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
