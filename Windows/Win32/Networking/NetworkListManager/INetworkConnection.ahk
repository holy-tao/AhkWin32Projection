#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetwork.ahk
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
     * @returns {INetwork} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-getnetwork
     */
    GetNetwork() {
        result := ComCall(7, this, "ptr*", &ppNetwork := 0, "HRESULT")
        return INetwork(ppNetwork)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-get_isconnectedtointernet
     */
    get_IsConnectedToInternet() {
        result := ComCall(8, this, "short*", &pbIsConnected := 0, "HRESULT")
        return pbIsConnected
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-get_isconnected
     */
    get_IsConnected() {
        result := ComCall(9, this, "short*", &pbIsConnected := 0, "HRESULT")
        return pbIsConnected
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-getconnectivity
     */
    GetConnectivity() {
        result := ComCall(10, this, "int*", &pConnectivity := 0, "HRESULT")
        return pConnectivity
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-getconnectionid
     */
    GetConnectionId() {
        pgdConnectionId := Guid()
        result := ComCall(11, this, "ptr", pgdConnectionId, "HRESULT")
        return pgdConnectionId
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-getadapterid
     */
    GetAdapterId() {
        pgdAdapterId := Guid()
        result := ComCall(12, this, "ptr", pgdAdapterId, "HRESULT")
        return pgdAdapterId
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-getdomaintype
     */
    GetDomainType() {
        result := ComCall(13, this, "int*", &pDomainType := 0, "HRESULT")
        return pDomainType
    }
}
