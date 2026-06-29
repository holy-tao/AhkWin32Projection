#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISClusNode.ahk" { ISClusNode }
#Import ".\ISClusResGroupResources.ahk" { ISClusResGroupResources }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\CLUSTER_GROUP_STATE.ahk" { CLUSTER_GROUP_STATE }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\ISCluster.ahk" { ISCluster }
#Import ".\ISClusResGroupPreferredOwnerNodes.ahk" { ISClusResGroupPreferredOwnerNodes }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISClusProperties.ahk" { ISClusProperties }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISClusResGroup extends IDispatch {
    /**
     * The interface identifier for ISClusResGroup
     * @type {Guid}
     */
    static IID := Guid("{f2e60706-2631-11d1-89f1-00a0c90d061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISClusResGroup interfaces
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
        get_OwnerNode           : IntPtr
        get_Resources           : IntPtr
        get_PreferredOwnerNodes : IntPtr
        Delete                  : IntPtr
        Online                  : IntPtr
        Move                    : IntPtr
        Offline                 : IntPtr
        get_Cluster             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISClusResGroup.Vtbl()
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
     * @type {CLUSTER_GROUP_STATE} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {ISClusNode} 
     */
    OwnerNode {
        get => this.get_OwnerNode()
    }

    /**
     * @type {ISClusResGroupResources} 
     */
    Resources {
        get => this.get_Resources()
    }

    /**
     * @type {ISClusResGroupPreferredOwnerNodes} 
     */
    PreferredOwnerNodes {
        get => this.get_PreferredOwnerNodes()
    }

    /**
     * @type {ISCluster} 
     */
    Cluster {
        get => this.get_Cluster()
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
     * @param {BSTR} bstrGroupName 
     * @returns {HRESULT} 
     */
    put_Name(bstrGroupName) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(13, this, BSTR, bstrGroupName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {CLUSTER_GROUP_STATE} 
     */
    get_State() {
        result := ComCall(14, this, "int*", &dwState := 0, "HRESULT")
        return dwState
    }

    /**
     * 
     * @returns {ISClusNode} 
     */
    get_OwnerNode() {
        result := ComCall(15, this, "ptr*", &ppOwnerNode := 0, "HRESULT")
        return ISClusNode(ppOwnerNode)
    }

    /**
     * 
     * @returns {ISClusResGroupResources} 
     */
    get_Resources() {
        result := ComCall(16, this, "ptr*", &ppClusterGroupResources := 0, "HRESULT")
        return ISClusResGroupResources(ppClusterGroupResources)
    }

    /**
     * 
     * @returns {ISClusResGroupPreferredOwnerNodes} 
     */
    get_PreferredOwnerNodes() {
        result := ComCall(17, this, "ptr*", &ppOwnerNodes := 0, "HRESULT")
        return ISClusResGroupPreferredOwnerNodes(ppOwnerNodes)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varTimeout 
     * @param {VARIANT} varNode 
     * @returns {VARIANT} 
     */
    Online(varTimeout, varNode) {
        pvarPending := VARIANT()
        result := ComCall(19, this, VARIANT, varTimeout, VARIANT, varNode, VARIANT.Ptr, pvarPending, "HRESULT")
        return pvarPending
    }

    /**
     * 
     * @param {VARIANT} varTimeout 
     * @param {VARIANT} varNode 
     * @returns {VARIANT} 
     */
    Move(varTimeout, varNode) {
        pvarPending := VARIANT()
        result := ComCall(20, this, VARIANT, varTimeout, VARIANT, varNode, VARIANT.Ptr, pvarPending, "HRESULT")
        return pvarPending
    }

    /**
     * 
     * @param {VARIANT} varTimeout 
     * @returns {VARIANT} 
     */
    Offline(varTimeout) {
        pvarPending := VARIANT()
        result := ComCall(21, this, VARIANT, varTimeout, VARIANT.Ptr, pvarPending, "HRESULT")
        return pvarPending
    }

    /**
     * 
     * @returns {ISCluster} 
     */
    get_Cluster() {
        result := ComCall(22, this, "ptr*", &ppCluster := 0, "HRESULT")
        return ISCluster(ppCluster)
    }

    Query(iid) {
        if (ISClusResGroup.IID.Equals(iid)) {
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
        this.vtbl.get_OwnerNode := CallbackCreate(GetMethod(implObj, "get_OwnerNode"), flags, 2)
        this.vtbl.get_Resources := CallbackCreate(GetMethod(implObj, "get_Resources"), flags, 2)
        this.vtbl.get_PreferredOwnerNodes := CallbackCreate(GetMethod(implObj, "get_PreferredOwnerNodes"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.Online := CallbackCreate(GetMethod(implObj, "Online"), flags, 4)
        this.vtbl.Move := CallbackCreate(GetMethod(implObj, "Move"), flags, 4)
        this.vtbl.Offline := CallbackCreate(GetMethod(implObj, "Offline"), flags, 3)
        this.vtbl.get_Cluster := CallbackCreate(GetMethod(implObj, "get_Cluster"), flags, 2)
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
        CallbackFree(this.vtbl.get_OwnerNode)
        CallbackFree(this.vtbl.get_Resources)
        CallbackFree(this.vtbl.get_PreferredOwnerNodes)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.Online)
        CallbackFree(this.vtbl.Move)
        CallbackFree(this.vtbl.Offline)
        CallbackFree(this.vtbl.get_Cluster)
    }
}
