#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISClusNodeNetInterfaces.ahk" { ISClusNodeNetInterfaces }
#Import ".\ISClusResGroups.ahk" { ISClusResGroups }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISCluster.ahk" { ISCluster }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISClusProperties.ahk" { ISClusProperties }
#Import ".\CLUSTER_NODE_STATE.ahk" { CLUSTER_NODE_STATE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISClusNode extends IDispatch {
    /**
     * The interface identifier for ISClusNode
     * @type {Guid}
     */
    static IID := Guid("{f2e606f8-2631-11d1-89f1-00a0c90d061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISClusNode interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_CommonProperties    : IntPtr
        get_PrivateProperties   : IntPtr
        get_CommonROProperties  : IntPtr
        get_PrivateROProperties : IntPtr
        get_Name                : IntPtr
        get_Handle              : IntPtr
        get_NodeID              : IntPtr
        get_State               : IntPtr
        Pause                   : IntPtr
        Resume                  : IntPtr
        Evict                   : IntPtr
        get_ResourceGroups      : IntPtr
        get_Cluster             : IntPtr
        get_NetInterfaces       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISClusNode.Vtbl()
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
     * @type {Pointer} 
     */
    Handle {
        get => this.get_Handle()
    }

    /**
     * @type {BSTR} 
     */
    NodeID {
        get => this.get_NodeID()
    }

    /**
     * @type {CLUSTER_NODE_STATE} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {ISClusResGroups} 
     */
    ResourceGroups {
        get => this.get_ResourceGroups()
    }

    /**
     * @type {ISCluster} 
     */
    Cluster {
        get => this.get_Cluster()
    }

    /**
     * @type {ISClusNodeNetInterfaces} 
     */
    NetInterfaces {
        get => this.get_NetInterfaces()
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
     * @returns {Pointer} 
     */
    get_Handle() {
        result := ComCall(12, this, "ptr*", &phandle := 0, "HRESULT")
        return phandle
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_NodeID() {
        pbstrNodeID := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbstrNodeID, "HRESULT")
        return pbstrNodeID
    }

    /**
     * 
     * @returns {CLUSTER_NODE_STATE} 
     */
    get_State() {
        result := ComCall(14, this, "int*", &dwState := 0, "HRESULT")
        return dwState
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/pause-method
     */
    Pause() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Evict() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISClusResGroups} 
     */
    get_ResourceGroups() {
        result := ComCall(18, this, "ptr*", &ppResourceGroups := 0, "HRESULT")
        return ISClusResGroups(ppResourceGroups)
    }

    /**
     * 
     * @returns {ISCluster} 
     */
    get_Cluster() {
        result := ComCall(19, this, "ptr*", &ppCluster := 0, "HRESULT")
        return ISCluster(ppCluster)
    }

    /**
     * 
     * @returns {ISClusNodeNetInterfaces} 
     */
    get_NetInterfaces() {
        result := ComCall(20, this, "ptr*", &ppClusNetInterfaces := 0, "HRESULT")
        return ISClusNodeNetInterfaces(ppClusNetInterfaces)
    }

    Query(iid) {
        if (ISClusNode.IID.Equals(iid)) {
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
        this.vtbl.get_Handle := CallbackCreate(GetMethod(implObj, "get_Handle"), flags, 2)
        this.vtbl.get_NodeID := CallbackCreate(GetMethod(implObj, "get_NodeID"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 1)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 1)
        this.vtbl.Evict := CallbackCreate(GetMethod(implObj, "Evict"), flags, 1)
        this.vtbl.get_ResourceGroups := CallbackCreate(GetMethod(implObj, "get_ResourceGroups"), flags, 2)
        this.vtbl.get_Cluster := CallbackCreate(GetMethod(implObj, "get_Cluster"), flags, 2)
        this.vtbl.get_NetInterfaces := CallbackCreate(GetMethod(implObj, "get_NetInterfaces"), flags, 2)
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
        CallbackFree(this.vtbl.get_Handle)
        CallbackFree(this.vtbl.get_NodeID)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.Resume)
        CallbackFree(this.vtbl.Evict)
        CallbackFree(this.vtbl.get_ResourceGroups)
        CallbackFree(this.vtbl.get_Cluster)
        CallbackFree(this.vtbl.get_NetInterfaces)
    }
}
