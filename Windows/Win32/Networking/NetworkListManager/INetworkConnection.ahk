#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\INetwork.ahk" { INetwork }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NLM_CONNECTIVITY.ahk" { NLM_CONNECTIVITY }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\NLM_DOMAIN_TYPE.ahk" { NLM_DOMAIN_TYPE }

/**
 * The INetworkConnection interface represents a single network connection.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nn-netlistmgr-inetworkconnection
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct INetworkConnection extends IDispatch {
    /**
     * The interface identifier for INetworkConnection
     * @type {Guid}
     */
    static IID := Guid("{dcb00005-570f-4a9b-8d69-199fdba5723b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetworkConnection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetNetwork                : IntPtr
        get_IsConnectedToInternet : IntPtr
        get_IsConnected           : IntPtr
        GetConnectivity           : IntPtr
        GetConnectionId           : IntPtr
        GetAdapterId              : IntPtr
        GetDomainType             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetworkConnection.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-getnetwork
     */
    GetNetwork() {
        result := ComCall(7, this, "ptr*", &ppNetwork := 0, "HRESULT")
        return INetwork(ppNetwork)
    }

    /**
     * The get_IsConnectedToInternet property specifies if the associated network connection has internet connectivity.
     * @returns {VARIANT_BOOL} If <b>TRUE</b>, this network connection has connectivity to the internet; if <b>FALSE</b>, it does not.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-get_isconnectedtointernet
     */
    get_IsConnectedToInternet() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &pbIsConnected := 0, "HRESULT")
        return pbIsConnected
    }

    /**
     * The get_IsConnected property specifies if the associated network connection has network connectivity.
     * @returns {VARIANT_BOOL} If <b>TRUE</b>, this network connection has connectivity; if <b>FALSE</b>, it does not.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-get_isconnected
     */
    get_IsConnected() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &pbIsConnected := 0, "HRESULT")
        return pbIsConnected
    }

    /**
     * The GetConnectivity method returns the connectivity state of the network connection.
     * @returns {NLM_CONNECTIVITY} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connectivity">NLM_CONNECTIVITY</a> enumeration value that contains  a bitmask that specifies the connectivity of this network connection.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-getconnectivity
     */
    GetConnectivity() {
        result := ComCall(10, this, "int*", &pConnectivity := 0, "HRESULT")
        return pConnectivity
    }

    /**
     * The GetConnectionID method returns the Connection ID associated with this network connection.
     * @returns {Guid} Pointer to a <b>GUID</b> that specifies the Connection ID associated with this network connection.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-getconnectionid
     */
    GetConnectionId() {
        pgdConnectionId := Guid()
        result := ComCall(11, this, Guid.Ptr, pgdConnectionId, "HRESULT")
        return pgdConnectionId
    }

    /**
     * The GetAdapterID method returns the ID of the network adapter used by this connection.
     * @remarks
     * It is possible for multiple connections to have the same AdapterID.
     * @returns {Guid} Pointer to a GUID that specifies the adapter ID of the TCP/IP  interface used by this network connection.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-getadapterid
     */
    GetAdapterId() {
        pgdAdapterId := Guid()
        result := ComCall(12, this, Guid.Ptr, pgdAdapterId, "HRESULT")
        return pgdAdapterId
    }

    /**
     * The GetDomainType method returns the domain type of the network connection.
     * @returns {NLM_DOMAIN_TYPE} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_domain_type">NLM_DOMAIN_TYPE</a> enumeration value that specifies the domain type of the network.
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkconnection-getdomaintype
     */
    GetDomainType() {
        result := ComCall(13, this, "int*", &pDomainType := 0, "HRESULT")
        return pDomainType
    }

    Query(iid) {
        if (INetworkConnection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNetwork := CallbackCreate(GetMethod(implObj, "GetNetwork"), flags, 2)
        this.vtbl.get_IsConnectedToInternet := CallbackCreate(GetMethod(implObj, "get_IsConnectedToInternet"), flags, 2)
        this.vtbl.get_IsConnected := CallbackCreate(GetMethod(implObj, "get_IsConnected"), flags, 2)
        this.vtbl.GetConnectivity := CallbackCreate(GetMethod(implObj, "GetConnectivity"), flags, 2)
        this.vtbl.GetConnectionId := CallbackCreate(GetMethod(implObj, "GetConnectionId"), flags, 2)
        this.vtbl.GetAdapterId := CallbackCreate(GetMethod(implObj, "GetAdapterId"), flags, 2)
        this.vtbl.GetDomainType := CallbackCreate(GetMethod(implObj, "GetDomainType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNetwork)
        CallbackFree(this.vtbl.get_IsConnectedToInternet)
        CallbackFree(this.vtbl.get_IsConnected)
        CallbackFree(this.vtbl.GetConnectivity)
        CallbackFree(this.vtbl.GetConnectionId)
        CallbackFree(this.vtbl.GetAdapterId)
        CallbackFree(this.vtbl.GetDomainType)
    }
}
