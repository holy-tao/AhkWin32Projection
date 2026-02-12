#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISClusProperties.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ISClusResPossibleOwnerNodes.ahk
#Include .\ISClusResDependencies.ahk
#Include .\ISClusResDependents.ahk
#Include .\ISClusResGroup.ahk
#Include .\ISClusNode.ahk
#Include .\ISCluster.ahk
#Include .\ISClusDisk.ahk
#Include .\ISClusRegistryKeys.ahk
#Include .\ISClusCryptoKeys.ahk
#Include .\ISClusResType.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusResource extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusResource
     * @type {Guid}
     */
    static IID => Guid("{f2e6070a-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommonProperties", "get_PrivateProperties", "get_CommonROProperties", "get_PrivateROProperties", "get_Handle", "get_Name", "put_Name", "get_State", "get_CoreFlag", "BecomeQuorumResource", "Delete", "Fail", "Online", "Offline", "ChangeResourceGroup", "AddResourceNode", "RemoveResourceNode", "CanResourceBeDependent", "get_PossibleOwnerNodes", "get_Dependencies", "get_Dependents", "get_Group", "get_OwnerNode", "get_Cluster", "get_ClassInfo", "get_Disk", "get_RegistryKeys", "get_CryptoKeys", "get_TypeName", "get_Type", "get_MaintenanceMode", "put_MaintenanceMode"]

    /**
     * @type {ISClusProperties} 
     */
    CommonProperties {
        get => this.get_CommonProperties()
    }

    /**
     * @type {ISClusProperties} 
     */
    PrivateProperties {
        get => this.get_PrivateProperties()
    }

    /**
     * @type {ISClusProperties} 
     */
    CommonROProperties {
        get => this.get_CommonROProperties()
    }

    /**
     * @type {ISClusProperties} 
     */
    PrivateROProperties {
        get => this.get_PrivateROProperties()
    }

    /**
     * @type {Pointer} 
     */
    Handle {
        get => this.get_Handle()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {Integer} 
     */
    CoreFlag {
        get => this.get_CoreFlag()
    }

    /**
     * @type {ISClusResPossibleOwnerNodes} 
     */
    PossibleOwnerNodes {
        get => this.get_PossibleOwnerNodes()
    }

    /**
     * @type {ISClusResDependencies} 
     */
    Dependencies {
        get => this.get_Dependencies()
    }

    /**
     * @type {ISClusResDependents} 
     */
    Dependents {
        get => this.get_Dependents()
    }

    /**
     * @type {ISClusResGroup} 
     */
    Group {
        get => this.get_Group()
    }

    /**
     * @type {ISClusNode} 
     */
    OwnerNode {
        get => this.get_OwnerNode()
    }

    /**
     * @type {ISCluster} 
     */
    Cluster {
        get => this.get_Cluster()
    }

    /**
     * @type {Integer} 
     */
    ClassInfo {
        get => this.get_ClassInfo()
    }

    /**
     * @type {ISClusDisk} 
     */
    Disk {
        get => this.get_Disk()
    }

    /**
     * @type {ISClusRegistryKeys} 
     */
    RegistryKeys {
        get => this.get_RegistryKeys()
    }

    /**
     * @type {ISClusCryptoKeys} 
     */
    CryptoKeys {
        get => this.get_CryptoKeys()
    }

    /**
     * @type {BSTR} 
     */
    TypeName {
        get => this.get_TypeName()
    }

    /**
     * @type {ISClusResType} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {BOOL} 
     */
    MaintenanceMode {
        get => this.get_MaintenanceMode()
        set => this.put_MaintenanceMode(value)
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_CommonProperties() {
        result := ComCall(7, this, "ptr*", &ppProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_PrivateProperties() {
        result := ComCall(8, this, "ptr*", &ppProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_CommonROProperties() {
        result := ComCall(9, this, "ptr*", &ppProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_PrivateROProperties() {
        result := ComCall(10, this, "ptr*", &ppProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_Handle() {
        result := ComCall(11, this, "ptr*", &phandle := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phandle
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(12, this, "ptr", pbstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrResourceName 
     * @returns {HRESULT} 
     */
    put_Name(bstrResourceName) {
        if(bstrResourceName is String) {
            pin := BSTR.Alloc(bstrResourceName)
            bstrResourceName := pin.Value
        }

        result := ComCall(13, this, "ptr", bstrResourceName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(14, this, "int*", &dwState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return dwState
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CoreFlag() {
        result := ComCall(15, this, "int*", &dwCoreFlag := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return dwCoreFlag
    }

    /**
     * 
     * @param {BSTR} bstrDevicePath 
     * @param {Integer} lMaxLogSize 
     * @returns {HRESULT} 
     */
    BecomeQuorumResource(bstrDevicePath, lMaxLogSize) {
        if(bstrDevicePath is String) {
            pin := BSTR.Alloc(bstrDevicePath)
            bstrDevicePath := pin.Value
        }

        result := ComCall(16, this, "ptr", bstrDevicePath, "int", lMaxLogSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Delete Method (ADOX Collections)
     * @remarks
     * An error will occur if the *Name* does not exist in the collection.  
     *   
     *  For [Tables](./tables-collection-adox.md) and [Users](./users-collection-adox.md) collections, an error will occur if the provider does not support deleting tables or users, respectively. For [Procedures](./procedures-collection-adox.md) and [Views](./views-collection-adox.md) collections, **Delete** will fail if the provider does not support persisting commands.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/delete-method-adox-collections
     */
    Delete() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initiates a resource failure.
     * @remarks
     * The resource identified by <i>hResource</i> is treated as inoperable, causing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a> to initiate the same  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/failover">failover</a> process that would result if the resource had actually failed. Applications call the  <b>FailClusterResource</b> function to test their policies for restarting resources and  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups">groups</a>.
     * 
     * Do not call  <b>FailClusterResource</b> from a resource DLL. For more information, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/function-calls-to-avoid-in-resource-dlls">Function Calls to Avoid in Resource DLLs</a>.
     * @returns {HRESULT} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/clusapi/nf-clusapi-failclusterresource
     */
    Fail() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Brings a group online. (OnlineClusterGroup)
     * @remarks
     * If the group cannot be brought online on the node identified by the <i>hDestinationNode</i> parameter, the  <b>OnlineClusterGroup</b> function fails.
     * 
     * If the <i>hDestinationNode</i> parameter is set to <b>NULL</b>,  <b>OnlineClusterGroup</b> brings the group online on the current node.
     * 
     * Do not call  <b>OnlineClusterGroup</b> from a resource DLL. For more information, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/function-calls-to-avoid-in-resource-dlls">Function Calls to Avoid in Resource DLLs</a>.
     * 
     * Do not pass LPC and RPC handles to the same function call. Otherwise, the call will raise an RPC exception and can have additional destructive effects. For information on how LPC and RPC handles are created, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/using-object-handles">Using Object Handles</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-opencluster">OpenCluster</a>.
     * @param {Integer} nTimeout 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/clusapi/nf-clusapi-onlineclustergroup
     */
    Online(nTimeout) {
        pvarPending := VARIANT()
        result := ComCall(19, this, "int", nTimeout, "ptr", pvarPending, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarPending
    }

    /**
     * Takes a group offline.
     * @remarks
     * Do not call  <b>OfflineClusterGroup</b> from a resource DLL. For more information, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/function-calls-to-avoid-in-resource-dlls">Function Calls to Avoid in Resource DLLs</a>.
     * @param {Integer} nTimeout 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/clusapi/nf-clusapi-offlineclustergroup
     */
    Offline(nTimeout) {
        pvarPending := VARIANT()
        result := ComCall(20, this, "int", nTimeout, "ptr", pvarPending, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarPending
    }

    /**
     * 
     * @param {ISClusResGroup} pResourceGroup 
     * @returns {HRESULT} 
     */
    ChangeResourceGroup(pResourceGroup) {
        result := ComCall(21, this, "ptr", pResourceGroup, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ISClusNode} pNode 
     * @returns {HRESULT} 
     */
    AddResourceNode(pNode) {
        result := ComCall(22, this, "ptr", pNode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ISClusNode} pNode 
     * @returns {HRESULT} 
     */
    RemoveResourceNode(pNode) {
        result := ComCall(23, this, "ptr", pNode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines if one resource can be dependent upon another resource.
     * @remarks
     * With the  <b>CanResourceBeDependent</b> function, for the resource identified by <i>hResource</i> to be dependent on the resource identified by <i>hResourceDependent</i>, the following must be true:
     * 
     * <ul>
     * <li>Both resources must be members of the same  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups">group</a>.</li>
     * <li>The resource identified by <i>hResourceDependent</i> cannot depend on the resource identified by <i>hResource</i>, either directly or indirectly.</li>
     * </ul>
     * Do not call  <b>CanResourceBeDependent</b> from any resource DLL entry point function.  <b>CanResourceBeDependent</b> can safely be called from a worker thread. For more information, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/function-calls-to-avoid-in-resource-dlls">Function Calls to Avoid in Resource DLLs</a>.
     * 
     * Do not pass LPC and RPC handles to the same function call. Otherwise, the call will raise an RPC exception and can have additional destructive effects. For information on how LPC and RPC handles are created, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/using-object-handles">Using Object Handles</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-opencluster">OpenCluster</a>.
     * @param {ISClusResource} pResource 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/clusapi/nf-clusapi-canresourcebedependent
     */
    CanResourceBeDependent(pResource) {
        pvarDependent := VARIANT()
        result := ComCall(24, this, "ptr", pResource, "ptr", pvarDependent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarDependent
    }

    /**
     * 
     * @returns {ISClusResPossibleOwnerNodes} 
     */
    get_PossibleOwnerNodes() {
        result := ComCall(25, this, "ptr*", &ppOwnerNodes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusResPossibleOwnerNodes(ppOwnerNodes)
    }

    /**
     * 
     * @returns {ISClusResDependencies} 
     */
    get_Dependencies() {
        result := ComCall(26, this, "ptr*", &ppResDependencies := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusResDependencies(ppResDependencies)
    }

    /**
     * 
     * @returns {ISClusResDependents} 
     */
    get_Dependents() {
        result := ComCall(27, this, "ptr*", &ppResDependents := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusResDependents(ppResDependents)
    }

    /**
     * 
     * @returns {ISClusResGroup} 
     */
    get_Group() {
        result := ComCall(28, this, "ptr*", &ppResGroup := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusResGroup(ppResGroup)
    }

    /**
     * 
     * @returns {ISClusNode} 
     */
    get_OwnerNode() {
        result := ComCall(29, this, "ptr*", &ppOwnerNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusNode(ppOwnerNode)
    }

    /**
     * 
     * @returns {ISCluster} 
     */
    get_Cluster() {
        result := ComCall(30, this, "ptr*", &ppCluster := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISCluster(ppCluster)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ClassInfo() {
        result := ComCall(31, this, "int*", &prcClassInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return prcClassInfo
    }

    /**
     * 
     * @returns {ISClusDisk} 
     */
    get_Disk() {
        result := ComCall(32, this, "ptr*", &ppDisk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusDisk(ppDisk)
    }

    /**
     * 
     * @returns {ISClusRegistryKeys} 
     */
    get_RegistryKeys() {
        result := ComCall(33, this, "ptr*", &ppRegistryKeys := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusRegistryKeys(ppRegistryKeys)
    }

    /**
     * 
     * @returns {ISClusCryptoKeys} 
     */
    get_CryptoKeys() {
        result := ComCall(34, this, "ptr*", &ppCryptoKeys := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusCryptoKeys(ppCryptoKeys)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_TypeName() {
        pbstrTypeName := BSTR()
        result := ComCall(35, this, "ptr", pbstrTypeName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrTypeName
    }

    /**
     * 
     * @returns {ISClusResType} 
     */
    get_Type() {
        result := ComCall(36, this, "ptr*", &ppResourceType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusResType(ppResourceType)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_MaintenanceMode() {
        result := ComCall(37, this, "int*", &pbMaintenanceMode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbMaintenanceMode
    }

    /**
     * 
     * @param {BOOL} bMaintenanceMode 
     * @returns {HRESULT} 
     */
    put_MaintenanceMode(bMaintenanceMode) {
        result := ComCall(38, this, "int", bMaintenanceMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
