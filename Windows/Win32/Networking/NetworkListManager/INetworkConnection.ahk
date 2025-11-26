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
     * The GetNetwork method returns the network associated with the connection.
     * @returns {INetwork} Pointer to a pointer that receives an <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/nn-netlistmgr-inetwork">INetwork</a> interface instance that specifies the network associated with the connection.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkconnection-getnetwork
     */
    GetNetwork() {
        result := ComCall(7, this, "ptr*", &ppNetwork := 0, "HRESULT")
        return INetwork(ppNetwork)
    }

    /**
     * The get_IsConnectedToInternet property specifies if the associated network connection has internet connectivity.
     * @returns {VARIANT_BOOL} If <b>TRUE</b>, this network connection has connectivity to the internet; if <b>FALSE</b>, it does not.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkconnection-get_isconnectedtointernet
     */
    get_IsConnectedToInternet() {
        result := ComCall(8, this, "short*", &pbIsConnected := 0, "HRESULT")
        return pbIsConnected
    }

    /**
     * The get_IsConnected property specifies if the associated network connection has network connectivity.
     * @returns {VARIANT_BOOL} If <b>TRUE</b>, this network connection has connectivity; if <b>FALSE</b>, it does not.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkconnection-get_isconnected
     */
    get_IsConnected() {
        result := ComCall(9, this, "short*", &pbIsConnected := 0, "HRESULT")
        return pbIsConnected
    }

    /**
     * The GetConnectivity method returns the connectivity state of the network connection.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connectivity">NLM_CONNECTIVITY</a> enumeration value that contains  a bitmask that specifies the connectivity of this network connection.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkconnection-getconnectivity
     */
    GetConnectivity() {
        result := ComCall(10, this, "int*", &pConnectivity := 0, "HRESULT")
        return pConnectivity
    }

    /**
     * The GetConnectionID method returns the Connection ID associated with this network connection.
     * @returns {Guid} Pointer to a <b>GUID</b> that specifies the Connection ID associated with this network connection.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkconnection-getconnectionid
     */
    GetConnectionId() {
        pgdConnectionId := Guid()
        result := ComCall(11, this, "ptr", pgdConnectionId, "HRESULT")
        return pgdConnectionId
    }

    /**
     * The GetAdapterID method returns the ID of the network adapter used by this connection.
     * @returns {Guid} Pointer to a GUID that specifies the adapter ID of the TCP/IP  interface used by this network connection.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkconnection-getadapterid
     */
    GetAdapterId() {
        pgdAdapterId := Guid()
        result := ComCall(12, this, "ptr", pgdAdapterId, "HRESULT")
        return pgdAdapterId
    }

    /**
     * The GetDomainType method returns the domain type of the network connection.
     * @returns {Integer} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_domain_type">NLM_DOMAIN_TYPE</a> enumeration value that specifies the domain type of the network.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkconnection-getdomaintype
     */
    GetDomainType() {
        result := ComCall(13, this, "int*", &pDomainType := 0, "HRESULT")
        return pDomainType
    }
}
