#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetworkConnection interface represents a single network connection.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-inetworkconnection
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetworkConnection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkConnection
     * @type {Guid}
     */
    static IID => Guid("{dcb00005-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNetwork", "get_IsConnectedToInternet", "get_IsConnected", "GetConnectivity", "GetConnectionId", "GetAdapterId", "GetDomainType"]

    /**
     * 
     * @param {Pointer<INetwork>} ppNetwork 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-getnetwork
     */
    GetNetwork(ppNetwork) {
        result := ComCall(7, this, "ptr*", ppNetwork, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIsConnected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-get_isconnectedtointernet
     */
    get_IsConnectedToInternet(pbIsConnected) {
        result := ComCall(8, this, "ptr", pbIsConnected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIsConnected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-get_isconnected
     */
    get_IsConnected(pbIsConnected) {
        result := ComCall(9, this, "ptr", pbIsConnected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pConnectivity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-getconnectivity
     */
    GetConnectivity(pConnectivity) {
        result := ComCall(10, this, "int*", pConnectivity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pgdConnectionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-getconnectionid
     */
    GetConnectionId(pgdConnectionId) {
        result := ComCall(11, this, "ptr", pgdConnectionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pgdAdapterId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-getadapterid
     */
    GetAdapterId(pgdAdapterId) {
        result := ComCall(12, this, "ptr", pgdAdapterId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDomainType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-getdomaintype
     */
    GetDomainType(pDomainType) {
        result := ComCall(13, this, "int*", pDomainType, "HRESULT")
        return result
    }
}
