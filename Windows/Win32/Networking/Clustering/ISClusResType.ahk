#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISClusResTypeResources.ahk" { ISClusResTypeResources }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISCluster.ahk" { ISCluster }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISClusResTypePossibleOwnerNodes.ahk" { ISClusResTypePossibleOwnerNodes }
#Import ".\ISClusProperties.ahk" { ISClusProperties }
#Import ".\ISClusDisks.ahk" { ISClusDisks }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISClusResType extends IDispatch {
    /**
     * The interface identifier for ISClusResType
     * @type {Guid}
     */
    static IID := Guid("{f2e60710-2631-11d1-89f1-00a0c90d061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISClusResType interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_CommonProperties    : IntPtr
        get_PrivateProperties   : IntPtr
        get_CommonROProperties  : IntPtr
        get_PrivateROProperties : IntPtr
        get_Name                : IntPtr
        Delete                  : IntPtr
        get_Cluster             : IntPtr
        get_Resources           : IntPtr
        get_PossibleOwnerNodes  : IntPtr
        get_AvailableDisks      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISClusResType.Vtbl()
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
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {ISCluster} 
     */
    Cluster {
        get => this.get_Cluster()
    }

    /**
     * @type {ISClusResTypeResources} 
     */
    Resources {
        get => this.get_Resources()
    }

    /**
     * @type {ISClusResTypePossibleOwnerNodes} 
     */
    PossibleOwnerNodes {
        get => this.get_PossibleOwnerNodes()
    }

    /**
     * @type {ISClusDisks} 
     */
    AvailableDisks {
        get => this.get_AvailableDisks()
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
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISCluster} 
     */
    get_Cluster() {
        result := ComCall(13, this, "ptr*", &ppCluster := 0, "HRESULT")
        return ISCluster(ppCluster)
    }

    /**
     * 
     * @returns {ISClusResTypeResources} 
     */
    get_Resources() {
        result := ComCall(14, this, "ptr*", &ppClusterResTypeResources := 0, "HRESULT")
        return ISClusResTypeResources(ppClusterResTypeResources)
    }

    /**
     * 
     * @returns {ISClusResTypePossibleOwnerNodes} 
     */
    get_PossibleOwnerNodes() {
        result := ComCall(15, this, "ptr*", &ppOwnerNodes := 0, "HRESULT")
        return ISClusResTypePossibleOwnerNodes(ppOwnerNodes)
    }

    /**
     * 
     * @returns {ISClusDisks} 
     */
    get_AvailableDisks() {
        result := ComCall(16, this, "ptr*", &ppAvailableDisks := 0, "HRESULT")
        return ISClusDisks(ppAvailableDisks)
    }

    Query(iid) {
        if (ISClusResType.IID.Equals(iid)) {
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
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.get_Cluster := CallbackCreate(GetMethod(implObj, "get_Cluster"), flags, 2)
        this.vtbl.get_Resources := CallbackCreate(GetMethod(implObj, "get_Resources"), flags, 2)
        this.vtbl.get_PossibleOwnerNodes := CallbackCreate(GetMethod(implObj, "get_PossibleOwnerNodes"), flags, 2)
        this.vtbl.get_AvailableDisks := CallbackCreate(GetMethod(implObj, "get_AvailableDisks"), flags, 2)
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
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.get_Cluster)
        CallbackFree(this.vtbl.get_Resources)
        CallbackFree(this.vtbl.get_PossibleOwnerNodes)
        CallbackFree(this.vtbl.get_AvailableDisks)
    }
}
