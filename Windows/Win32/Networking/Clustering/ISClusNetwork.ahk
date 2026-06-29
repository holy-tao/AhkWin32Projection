#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CLUSTER_NETWORK_STATE.ahk" { CLUSTER_NETWORK_STATE }
#Import ".\ISClusNetworkNetInterfaces.ahk" { ISClusNetworkNetInterfaces }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISCluster.ahk" { ISCluster }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISClusProperties.ahk" { ISClusProperties }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISClusNetwork extends IDispatch {
    /**
     * The interface identifier for ISClusNetwork
     * @type {Guid}
     */
    static IID := Guid("{f2e606f2-2631-11d1-89f1-00a0c90d061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISClusNetwork interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_CommonProperties    : IntPtr
        get_PrivateProperties   : IntPtr
        get_CommonROProperties  : IntPtr
        get_PrivateROProperties : IntPtr
        get_Handle              : IntPtr
        get_Name                : IntPtr
        put_Name                : IntPtr
        get_NetworkID           : IntPtr
        get_State               : IntPtr
        get_NetInterfaces       : IntPtr
        get_Cluster             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISClusNetwork.Vtbl()
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
     * @type {BSTR} 
     */
    NetworkID {
        get => this.get_NetworkID()
    }

    /**
     * @type {CLUSTER_NETWORK_STATE} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {ISClusNetworkNetInterfaces} 
     */
    NetInterfaces {
        get => this.get_NetInterfaces()
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
     * @param {BSTR} bstrNetworkName 
     * @returns {HRESULT} 
     */
    put_Name(bstrNetworkName) {
        bstrNetworkName := bstrNetworkName is String ? BSTR.Alloc(bstrNetworkName).Value : bstrNetworkName

        result := ComCall(13, this, BSTR, bstrNetworkName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_NetworkID() {
        pbstrNetworkID := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pbstrNetworkID, "HRESULT")
        return pbstrNetworkID
    }

    /**
     * 
     * @returns {CLUSTER_NETWORK_STATE} 
     */
    get_State() {
        result := ComCall(15, this, "int*", &dwState := 0, "HRESULT")
        return dwState
    }

    /**
     * 
     * @returns {ISClusNetworkNetInterfaces} 
     */
    get_NetInterfaces() {
        result := ComCall(16, this, "ptr*", &ppClusNetInterfaces := 0, "HRESULT")
        return ISClusNetworkNetInterfaces(ppClusNetInterfaces)
    }

    /**
     * 
     * @returns {ISCluster} 
     */
    get_Cluster() {
        result := ComCall(17, this, "ptr*", &ppCluster := 0, "HRESULT")
        return ISCluster(ppCluster)
    }

    Query(iid) {
        if (ISClusNetwork.IID.Equals(iid)) {
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
        this.vtbl.get_NetworkID := CallbackCreate(GetMethod(implObj, "get_NetworkID"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_NetInterfaces := CallbackCreate(GetMethod(implObj, "get_NetInterfaces"), flags, 2)
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
        CallbackFree(this.vtbl.get_NetworkID)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_NetInterfaces)
        CallbackFree(this.vtbl.get_Cluster)
    }
}
