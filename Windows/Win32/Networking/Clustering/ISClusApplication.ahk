#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<ISDomainNames>} ppDomains 
     * @returns {HRESULT} 
     */
    get_DomainNames(ppDomains) {
        result := ComCall(7, this, "ptr*", ppDomains, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDomainName 
     * @param {Pointer<ISClusterNames>} ppClusters 
     * @returns {HRESULT} 
     */
    get_ClusterNames(bstrDomainName, ppClusters) {
        bstrDomainName := bstrDomainName is String ? BSTR.Alloc(bstrDomainName).Value : bstrDomainName

        result := ComCall(8, this, "ptr", bstrDomainName, "ptr*", ppClusters, "HRESULT")
        return result
    }

    /**
     * Opens a connection to a cluster and returns a handle to it.
     * @param {BSTR} bstrClusterName 
     * @param {Pointer<ISCluster>} pCluster 
     * @returns {HRESULT} If the operation was successful, <b>OpenCluster</b> returns 
     *        a cluster handle.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULL</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the function 
     *          <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-opencluster
     */
    OpenCluster(bstrClusterName, pCluster) {
        bstrClusterName := bstrClusterName is String ? BSTR.Alloc(bstrClusterName).Value : bstrClusterName

        result := ComCall(9, this, "ptr", bstrClusterName, "ptr*", pCluster, "HRESULT")
        return result
    }
}
