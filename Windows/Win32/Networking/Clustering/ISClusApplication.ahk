#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISDomainNames.ahk
#Include .\ISClusterNames.ahk
#Include .\ISCluster.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusApplication extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusApplication
     * @type {Guid}
     */
    static IID => Guid("{f2e606e6-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DomainNames", "get_ClusterNames", "OpenCluster"]

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

        result := ComCall(8, this, "ptr", bstrDomainName, "ptr*", &ppClusters := 0, "HRESULT")
        return ISClusterNames(ppClusters)
    }

    /**
     * Opens a connection to a cluster and returns a handle to it.
     * @param {BSTR} bstrClusterName 
     * @returns {ISCluster} 
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-opencluster
     */
    OpenCluster(bstrClusterName) {
        bstrClusterName := bstrClusterName is String ? BSTR.Alloc(bstrClusterName).Value : bstrClusterName

        result := ComCall(9, this, "ptr", bstrClusterName, "ptr*", &pCluster := 0, "HRESULT")
        return ISCluster(pCluster)
    }
}
