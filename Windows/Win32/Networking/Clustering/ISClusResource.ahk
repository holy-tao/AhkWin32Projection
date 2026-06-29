#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISCluster.ahk" { ISCluster }
#Import ".\ISClusResGroup.ahk" { ISClusResGroup }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISClusRegistryKeys.ahk" { ISClusRegistryKeys }
#Import ".\ISClusResDependents.ahk" { ISClusResDependents }
#Import ".\CLUSTER_RESOURCE_CLASS.ahk" { CLUSTER_RESOURCE_CLASS }
#Import ".\ISClusCryptoKeys.ahk" { ISClusCryptoKeys }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\ISClusProperties.ahk" { ISClusProperties }
#Import ".\ISClusResType.ahk" { ISClusResType }
#Import ".\ISClusDisk.ahk" { ISClusDisk }
#Import ".\ISClusResDependencies.ahk" { ISClusResDependencies }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CLUS_FLAGS.ahk" { CLUS_FLAGS }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISClusResPossibleOwnerNodes.ahk" { ISClusResPossibleOwnerNodes }
#Import ".\CLUSTER_RESOURCE_STATE.ahk" { CLUSTER_RESOURCE_STATE }
#Import ".\ISClusNode.ahk" { ISClusNode }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISClusResource extends IDispatch {
    /**
     * The interface identifier for ISClusResource
     * @type {Guid}
     */
    static IID := Guid("{f2e6070a-2631-11d1-89f1-00a0c90d061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISClusResource interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_CommonProperties    : IntPtr
        get_PrivateProperties   : IntPtr
        get_CommonROProperties  : IntPtr
        get_PrivateROProperties : IntPtr
        get_Handle              : IntPtr
        get_Name                : IntPtr
        put_Name                : IntPtr
        get_State               : IntPtr
        get_CoreFlag            : IntPtr
        BecomeQuorumResource    : IntPtr
        Delete                  : IntPtr
        Fail                    : IntPtr
        Online                  : IntPtr
        Offline                 : IntPtr
        ChangeResourceGroup     : IntPtr
        AddResourceNode         : IntPtr
        RemoveResourceNode      : IntPtr
        CanResourceBeDependent  : IntPtr
        get_PossibleOwnerNodes  : IntPtr
        get_Dependencies        : IntPtr
        get_Dependents          : IntPtr
        get_Group               : IntPtr
        get_OwnerNode           : IntPtr
        get_Cluster             : IntPtr
        get_ClassInfo           : IntPtr
        get_Disk                : IntPtr
        get_RegistryKeys        : IntPtr
        get_CryptoKeys          : IntPtr
        get_TypeName            : IntPtr
        get_Type                : IntPtr
        get_MaintenanceMode     : IntPtr
        put_MaintenanceMode     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISClusResource.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {CLUSTER_RESOURCE_STATE} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {CLUS_FLAGS} 
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
     * @type {CLUSTER_RESOURCE_CLASS} 
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
        result := ComCall(7, this, "ptr*", &ppProperties := 0, "HRESULT")
        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_PrivateProperties() {
        result := ComCall(8, this, "ptr*", &ppProperties := 0, "HRESULT")
        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_CommonROProperties() {
        result := ComCall(9, this, "ptr*", &ppProperties := 0, "HRESULT")
        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_PrivateROProperties() {
        result := ComCall(10, this, "ptr*", &ppProperties := 0, "HRESULT")
        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_Handle() {
        result := ComCall(11, this, "ptr*", &phandle := 0, "HRESULT")
        return phandle
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrResourceName 
     * @returns {HRESULT} 
     */
    put_Name(bstrResourceName) {
        bstrResourceName := bstrResourceName is String ? BSTR.Alloc(bstrResourceName).Value : bstrResourceName

        result := ComCall(13, this, BSTR, bstrResourceName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {CLUSTER_RESOURCE_STATE} 
     */
    get_State() {
        result := ComCall(14, this, "int*", &dwState := 0, "HRESULT")
        return dwState
    }

    /**
     * 
     * @returns {CLUS_FLAGS} 
     */
    get_CoreFlag() {
        result := ComCall(15, this, "int*", &dwCoreFlag := 0, "HRESULT")
        return dwCoreFlag
    }

    /**
     * 
     * @param {BSTR} bstrDevicePath 
     * @param {Integer} lMaxLogSize 
     * @returns {HRESULT} 
     */
    BecomeQuorumResource(bstrDevicePath, lMaxLogSize) {
        bstrDevicePath := bstrDevicePath is String ? BSTR.Alloc(bstrDevicePath).Value : bstrDevicePath

        result := ComCall(16, this, BSTR, bstrDevicePath, "int", lMaxLogSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Fail() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nTimeout 
     * @returns {VARIANT} 
     */
    Online(nTimeout) {
        pvarPending := VARIANT()
        result := ComCall(19, this, "int", nTimeout, VARIANT.Ptr, pvarPending, "HRESULT")
        return pvarPending
    }

    /**
     * 
     * @param {Integer} nTimeout 
     * @returns {VARIANT} 
     */
    Offline(nTimeout) {
        pvarPending := VARIANT()
        result := ComCall(20, this, "int", nTimeout, VARIANT.Ptr, pvarPending, "HRESULT")
        return pvarPending
    }

    /**
     * 
     * @param {ISClusResGroup} pResourceGroup 
     * @returns {HRESULT} 
     */
    ChangeResourceGroup(pResourceGroup) {
        result := ComCall(21, this, "ptr", pResourceGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISClusNode} pNode 
     * @returns {HRESULT} 
     */
    AddResourceNode(pNode) {
        result := ComCall(22, this, "ptr", pNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISClusNode} pNode 
     * @returns {HRESULT} 
     */
    RemoveResourceNode(pNode) {
        result := ComCall(23, this, "ptr", pNode, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/clusapi/nf-clusapi-canresourcebedependent
     */
    CanResourceBeDependent(pResource) {
        pvarDependent := VARIANT()
        result := ComCall(24, this, "ptr", pResource, VARIANT.Ptr, pvarDependent, "HRESULT")
        return pvarDependent
    }

    /**
     * 
     * @returns {ISClusResPossibleOwnerNodes} 
     */
    get_PossibleOwnerNodes() {
        result := ComCall(25, this, "ptr*", &ppOwnerNodes := 0, "HRESULT")
        return ISClusResPossibleOwnerNodes(ppOwnerNodes)
    }

    /**
     * 
     * @returns {ISClusResDependencies} 
     */
    get_Dependencies() {
        result := ComCall(26, this, "ptr*", &ppResDependencies := 0, "HRESULT")
        return ISClusResDependencies(ppResDependencies)
    }

    /**
     * 
     * @returns {ISClusResDependents} 
     */
    get_Dependents() {
        result := ComCall(27, this, "ptr*", &ppResDependents := 0, "HRESULT")
        return ISClusResDependents(ppResDependents)
    }

    /**
     * 
     * @returns {ISClusResGroup} 
     */
    get_Group() {
        result := ComCall(28, this, "ptr*", &ppResGroup := 0, "HRESULT")
        return ISClusResGroup(ppResGroup)
    }

    /**
     * 
     * @returns {ISClusNode} 
     */
    get_OwnerNode() {
        result := ComCall(29, this, "ptr*", &ppOwnerNode := 0, "HRESULT")
        return ISClusNode(ppOwnerNode)
    }

    /**
     * 
     * @returns {ISCluster} 
     */
    get_Cluster() {
        result := ComCall(30, this, "ptr*", &ppCluster := 0, "HRESULT")
        return ISCluster(ppCluster)
    }

    /**
     * 
     * @returns {CLUSTER_RESOURCE_CLASS} 
     */
    get_ClassInfo() {
        result := ComCall(31, this, "int*", &prcClassInfo := 0, "HRESULT")
        return prcClassInfo
    }

    /**
     * 
     * @returns {ISClusDisk} 
     */
    get_Disk() {
        result := ComCall(32, this, "ptr*", &ppDisk := 0, "HRESULT")
        return ISClusDisk(ppDisk)
    }

    /**
     * 
     * @returns {ISClusRegistryKeys} 
     */
    get_RegistryKeys() {
        result := ComCall(33, this, "ptr*", &ppRegistryKeys := 0, "HRESULT")
        return ISClusRegistryKeys(ppRegistryKeys)
    }

    /**
     * 
     * @returns {ISClusCryptoKeys} 
     */
    get_CryptoKeys() {
        result := ComCall(34, this, "ptr*", &ppCryptoKeys := 0, "HRESULT")
        return ISClusCryptoKeys(ppCryptoKeys)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_TypeName() {
        pbstrTypeName := BSTR.Owned()
        result := ComCall(35, this, BSTR.Ptr, pbstrTypeName, "HRESULT")
        return pbstrTypeName
    }

    /**
     * 
     * @returns {ISClusResType} 
     */
    get_Type() {
        result := ComCall(36, this, "ptr*", &ppResourceType := 0, "HRESULT")
        return ISClusResType(ppResourceType)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_MaintenanceMode() {
        result := ComCall(37, this, BOOL.Ptr, &pbMaintenanceMode := 0, "HRESULT")
        return pbMaintenanceMode
    }

    /**
     * 
     * @param {BOOL} bMaintenanceMode 
     * @returns {HRESULT} 
     */
    put_MaintenanceMode(bMaintenanceMode) {
        result := ComCall(38, this, BOOL, bMaintenanceMode, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISClusResource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CommonProperties := CallbackCreate(GetMethod(implObj, "get_CommonProperties"), flags, 2)
        this.vtbl.get_PrivateProperties := CallbackCreate(GetMethod(implObj, "get_PrivateProperties"), flags, 2)
        this.vtbl.get_CommonROProperties := CallbackCreate(GetMethod(implObj, "get_CommonROProperties"), flags, 2)
        this.vtbl.get_PrivateROProperties := CallbackCreate(GetMethod(implObj, "get_PrivateROProperties"), flags, 2)
        this.vtbl.get_Handle := CallbackCreate(GetMethod(implObj, "get_Handle"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_CoreFlag := CallbackCreate(GetMethod(implObj, "get_CoreFlag"), flags, 2)
        this.vtbl.BecomeQuorumResource := CallbackCreate(GetMethod(implObj, "BecomeQuorumResource"), flags, 3)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.Fail := CallbackCreate(GetMethod(implObj, "Fail"), flags, 1)
        this.vtbl.Online := CallbackCreate(GetMethod(implObj, "Online"), flags, 3)
        this.vtbl.Offline := CallbackCreate(GetMethod(implObj, "Offline"), flags, 3)
        this.vtbl.ChangeResourceGroup := CallbackCreate(GetMethod(implObj, "ChangeResourceGroup"), flags, 2)
        this.vtbl.AddResourceNode := CallbackCreate(GetMethod(implObj, "AddResourceNode"), flags, 2)
        this.vtbl.RemoveResourceNode := CallbackCreate(GetMethod(implObj, "RemoveResourceNode"), flags, 2)
        this.vtbl.CanResourceBeDependent := CallbackCreate(GetMethod(implObj, "CanResourceBeDependent"), flags, 3)
        this.vtbl.get_PossibleOwnerNodes := CallbackCreate(GetMethod(implObj, "get_PossibleOwnerNodes"), flags, 2)
        this.vtbl.get_Dependencies := CallbackCreate(GetMethod(implObj, "get_Dependencies"), flags, 2)
        this.vtbl.get_Dependents := CallbackCreate(GetMethod(implObj, "get_Dependents"), flags, 2)
        this.vtbl.get_Group := CallbackCreate(GetMethod(implObj, "get_Group"), flags, 2)
        this.vtbl.get_OwnerNode := CallbackCreate(GetMethod(implObj, "get_OwnerNode"), flags, 2)
        this.vtbl.get_Cluster := CallbackCreate(GetMethod(implObj, "get_Cluster"), flags, 2)
        this.vtbl.get_ClassInfo := CallbackCreate(GetMethod(implObj, "get_ClassInfo"), flags, 2)
        this.vtbl.get_Disk := CallbackCreate(GetMethod(implObj, "get_Disk"), flags, 2)
        this.vtbl.get_RegistryKeys := CallbackCreate(GetMethod(implObj, "get_RegistryKeys"), flags, 2)
        this.vtbl.get_CryptoKeys := CallbackCreate(GetMethod(implObj, "get_CryptoKeys"), flags, 2)
        this.vtbl.get_TypeName := CallbackCreate(GetMethod(implObj, "get_TypeName"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_MaintenanceMode := CallbackCreate(GetMethod(implObj, "get_MaintenanceMode"), flags, 2)
        this.vtbl.put_MaintenanceMode := CallbackCreate(GetMethod(implObj, "put_MaintenanceMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CommonProperties)
        CallbackFree(this.vtbl.get_PrivateProperties)
        CallbackFree(this.vtbl.get_CommonROProperties)
        CallbackFree(this.vtbl.get_PrivateROProperties)
        CallbackFree(this.vtbl.get_Handle)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_CoreFlag)
        CallbackFree(this.vtbl.BecomeQuorumResource)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.Fail)
        CallbackFree(this.vtbl.Online)
        CallbackFree(this.vtbl.Offline)
        CallbackFree(this.vtbl.ChangeResourceGroup)
        CallbackFree(this.vtbl.AddResourceNode)
        CallbackFree(this.vtbl.RemoveResourceNode)
        CallbackFree(this.vtbl.CanResourceBeDependent)
        CallbackFree(this.vtbl.get_PossibleOwnerNodes)
        CallbackFree(this.vtbl.get_Dependencies)
        CallbackFree(this.vtbl.get_Dependents)
        CallbackFree(this.vtbl.get_Group)
        CallbackFree(this.vtbl.get_OwnerNode)
        CallbackFree(this.vtbl.get_Cluster)
        CallbackFree(this.vtbl.get_ClassInfo)
        CallbackFree(this.vtbl.get_Disk)
        CallbackFree(this.vtbl.get_RegistryKeys)
        CallbackFree(this.vtbl.get_CryptoKeys)
        CallbackFree(this.vtbl.get_TypeName)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_MaintenanceMode)
        CallbackFree(this.vtbl.put_MaintenanceMode)
    }
}
