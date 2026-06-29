#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISCluster.ahk" { ISCluster }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISDomainNames.ahk" { ISDomainNames }
#Import ".\ISClusterNames.ahk" { ISClusterNames }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISClusApplication extends IDispatch {
    /**
     * The interface identifier for ISClusApplication
     * @type {Guid}
     */
    static IID := Guid("{f2e606e6-2631-11d1-89f1-00a0c90d061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISClusApplication interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DomainNames  : IntPtr
        get_ClusterNames : IntPtr
        OpenCluster      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISClusApplication.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISDomainNames} 
     */
    DomainNames {
        get => this.get_DomainNames()
    }

    /**
     * 
     * @returns {ISDomainNames} 
     */
    get_DomainNames() {
        result := ComCall(7, this, "ptr*", &ppDomains := 0, "HRESULT")
        return ISDomainNames(ppDomains)
    }

    /**
     * 
     * @param {BSTR} bstrDomainName 
     * @returns {ISClusterNames} 
     */
    get_ClusterNames(bstrDomainName) {
        bstrDomainName := bstrDomainName is String ? BSTR.Alloc(bstrDomainName).Value : bstrDomainName

        result := ComCall(8, this, BSTR, bstrDomainName, "ptr*", &ppClusters := 0, "HRESULT")
        return ISClusterNames(ppClusters)
    }

    /**
     * Opens a connection to a cluster and returns a handle to it. (OpenCluster)
     * @remarks
     * A cluster handle is a pointer to an internally defined structure which stores information about the RPC or LPC 
     *      connection to the cluster. Any object handles obtained from the cluster handle will be associated with the RPC or 
     *      LPC session data stored in the cluster structure. Combining RPC and LPC handles or using handles obtained from 
     *      different contexts can cause exceptions or other unpredictable results. For more information, see 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/lpc-and-rpc-handles">LPC and RPC Handles</a>.
     * 
     * When finished with a cluster handle, it is important to call 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-closecluster">CloseCluster</a> to ensure that all memory is freed and the 
     *      connection is shut down cleanly.
     * 
     * If the cluster is remote, the client must be running a compatible operating system. For example computers running 
     *      Windows Server 2008 cannot call <b>OpenCluster</b> against a 
     *      cluster running Windows Server 2016. To remotely manage these clusters, use 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/failover-cluster-apis-portal">the Failover Cluster WMI Provider</a>.
     * @param {BSTR} bstrClusterName 
     * @returns {ISCluster} 
     * @see https://learn.microsoft.com/windows/win32/api/clusapi/nf-clusapi-opencluster
     */
    OpenCluster(bstrClusterName) {
        bstrClusterName := bstrClusterName is String ? BSTR.Alloc(bstrClusterName).Value : bstrClusterName

        result := ComCall(9, this, BSTR, bstrClusterName, "ptr*", &pCluster := 0, "HRESULT")
        return ISCluster(pCluster)
    }

    Query(iid) {
        if (ISClusApplication.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DomainNames := CallbackCreate(GetMethod(implObj, "get_DomainNames"), flags, 2)
        this.vtbl.get_ClusterNames := CallbackCreate(GetMethod(implObj, "get_ClusterNames"), flags, 3)
        this.vtbl.OpenCluster := CallbackCreate(GetMethod(implObj, "OpenCluster"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DomainNames)
        CallbackFree(this.vtbl.get_ClusterNames)
        CallbackFree(this.vtbl.OpenCluster)
    }
}
