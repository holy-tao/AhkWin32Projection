#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISClusResGroups.ahk" { ISClusResGroups }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISClusNetInterfaces.ahk" { ISClusNetInterfaces }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISClusVersion.ahk" { ISClusVersion }
#Import ".\ISClusNetworks.ahk" { ISClusNetworks }
#Import ".\ISClusResources.ahk" { ISClusResources }
#Import ".\ISClusResource.ahk" { ISClusResource }
#Import ".\ISClusProperties.ahk" { ISClusProperties }
#Import ".\ISClusResTypes.ahk" { ISClusResTypes }
#Import ".\ISClusNodes.ahk" { ISClusNodes }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISCluster extends IDispatch {
    /**
     * The interface identifier for ISCluster
     * @type {Guid}
     */
    static IID := Guid("{f2e606e4-2631-11d1-89f1-00a0c90d061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISCluster interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_CommonProperties    : IntPtr
        get_PrivateProperties   : IntPtr
        get_CommonROProperties  : IntPtr
        get_PrivateROProperties : IntPtr
        get_Handle              : IntPtr
        Open                    : IntPtr
        get_Name                : IntPtr
        put_Name                : IntPtr
        get_Version             : IntPtr
        put_QuorumResource      : IntPtr
        get_QuorumResource      : IntPtr
        get_QuorumLogSize       : IntPtr
        put_QuorumLogSize       : IntPtr
        get_QuorumPath          : IntPtr
        put_QuorumPath          : IntPtr
        get_Nodes               : IntPtr
        get_ResourceGroups      : IntPtr
        get_Resources           : IntPtr
        get_ResourceTypes       : IntPtr
        get_Networks            : IntPtr
        get_NetInterfaces       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISCluster.Vtbl()
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
     * @type {ISClusVersion} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * @type {ISClusResource} 
     */
    QuorumResource {
        get => this.get_QuorumResource()
        set => this.put_QuorumResource(value)
    }

    /**
     * @type {Integer} 
     */
    QuorumLogSize {
        get => this.get_QuorumLogSize()
        set => this.put_QuorumLogSize(value)
    }

    /**
     * @type {BSTR} 
     */
    QuorumPath {
        get => this.get_QuorumPath()
        set => this.put_QuorumPath(value)
    }

    /**
     * @type {ISClusNodes} 
     */
    Nodes {
        get => this.get_Nodes()
    }

    /**
     * @type {ISClusResGroups} 
     */
    ResourceGroups {
        get => this.get_ResourceGroups()
    }

    /**
     * @type {ISClusResources} 
     */
    Resources {
        get => this.get_Resources()
    }

    /**
     * @type {ISClusResTypes} 
     */
    ResourceTypes {
        get => this.get_ResourceTypes()
    }

    /**
     * @type {ISClusNetworks} 
     */
    Networks {
        get => this.get_Networks()
    }

    /**
     * @type {ISClusNetInterfaces} 
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
     * @returns {Pointer} 
     */
    get_Handle() {
        result := ComCall(11, this, "ptr*", &phandle := 0, "HRESULT")
        return phandle
    }

    /**
     * 
     * @param {BSTR} bstrClusterName 
     * @returns {HRESULT} 
     */
    Open(bstrClusterName) {
        bstrClusterName := bstrClusterName is String ? BSTR.Alloc(bstrClusterName).Value : bstrClusterName

        result := ComCall(12, this, BSTR, bstrClusterName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrClusterName 
     * @returns {HRESULT} 
     */
    put_Name(bstrClusterName) {
        bstrClusterName := bstrClusterName is String ? BSTR.Alloc(bstrClusterName).Value : bstrClusterName

        result := ComCall(14, this, BSTR, bstrClusterName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISClusVersion} 
     */
    get_Version() {
        result := ComCall(15, this, "ptr*", &ppClusVersion := 0, "HRESULT")
        return ISClusVersion(ppClusVersion)
    }

    /**
     * 
     * @param {ISClusResource} pClusterResource 
     * @returns {HRESULT} 
     */
    put_QuorumResource(pClusterResource) {
        result := ComCall(16, this, "ptr", pClusterResource, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISClusResource} 
     */
    get_QuorumResource() {
        result := ComCall(17, this, "ptr*", &pClusterResource := 0, "HRESULT")
        return ISClusResource(pClusterResource)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QuorumLogSize() {
        result := ComCall(18, this, "int*", &pnLogSize := 0, "HRESULT")
        return pnLogSize
    }

    /**
     * 
     * @param {Integer} nLogSize 
     * @returns {HRESULT} 
     */
    put_QuorumLogSize(nLogSize) {
        result := ComCall(19, this, "int", nLogSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_QuorumPath() {
        ppPath := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, ppPath, "HRESULT")
        return ppPath
    }

    /**
     * 
     * @param {BSTR} pPath 
     * @returns {HRESULT} 
     */
    put_QuorumPath(pPath) {
        pPath := pPath is String ? BSTR.Alloc(pPath).Value : pPath

        result := ComCall(21, this, BSTR, pPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISClusNodes} 
     */
    get_Nodes() {
        result := ComCall(22, this, "ptr*", &ppNodes := 0, "HRESULT")
        return ISClusNodes(ppNodes)
    }

    /**
     * 
     * @returns {ISClusResGroups} 
     */
    get_ResourceGroups() {
        result := ComCall(23, this, "ptr*", &ppClusterResourceGroups := 0, "HRESULT")
        return ISClusResGroups(ppClusterResourceGroups)
    }

    /**
     * 
     * @returns {ISClusResources} 
     */
    get_Resources() {
        result := ComCall(24, this, "ptr*", &ppClusterResources := 0, "HRESULT")
        return ISClusResources(ppClusterResources)
    }

    /**
     * 
     * @returns {ISClusResTypes} 
     */
    get_ResourceTypes() {
        result := ComCall(25, this, "ptr*", &ppResourceTypes := 0, "HRESULT")
        return ISClusResTypes(ppResourceTypes)
    }

    /**
     * 
     * @returns {ISClusNetworks} 
     */
    get_Networks() {
        result := ComCall(26, this, "ptr*", &ppNetworks := 0, "HRESULT")
        return ISClusNetworks(ppNetworks)
    }

    /**
     * 
     * @returns {ISClusNetInterfaces} 
     */
    get_NetInterfaces() {
        result := ComCall(27, this, "ptr*", &ppNetInterfaces := 0, "HRESULT")
        return ISClusNetInterfaces(ppNetInterfaces)
    }

    Query(iid) {
        if (ISCluster.IID.Equals(iid)) {
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
        this.vtbl.Open := CallbackCreate(GetMethod(implObj, "Open"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_Version := CallbackCreate(GetMethod(implObj, "get_Version"), flags, 2)
        this.vtbl.put_QuorumResource := CallbackCreate(GetMethod(implObj, "put_QuorumResource"), flags, 2)
        this.vtbl.get_QuorumResource := CallbackCreate(GetMethod(implObj, "get_QuorumResource"), flags, 2)
        this.vtbl.get_QuorumLogSize := CallbackCreate(GetMethod(implObj, "get_QuorumLogSize"), flags, 2)
        this.vtbl.put_QuorumLogSize := CallbackCreate(GetMethod(implObj, "put_QuorumLogSize"), flags, 2)
        this.vtbl.get_QuorumPath := CallbackCreate(GetMethod(implObj, "get_QuorumPath"), flags, 2)
        this.vtbl.put_QuorumPath := CallbackCreate(GetMethod(implObj, "put_QuorumPath"), flags, 2)
        this.vtbl.get_Nodes := CallbackCreate(GetMethod(implObj, "get_Nodes"), flags, 2)
        this.vtbl.get_ResourceGroups := CallbackCreate(GetMethod(implObj, "get_ResourceGroups"), flags, 2)
        this.vtbl.get_Resources := CallbackCreate(GetMethod(implObj, "get_Resources"), flags, 2)
        this.vtbl.get_ResourceTypes := CallbackCreate(GetMethod(implObj, "get_ResourceTypes"), flags, 2)
        this.vtbl.get_Networks := CallbackCreate(GetMethod(implObj, "get_Networks"), flags, 2)
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
        CallbackFree(this.vtbl.get_Handle)
        CallbackFree(this.vtbl.Open)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_Version)
        CallbackFree(this.vtbl.put_QuorumResource)
        CallbackFree(this.vtbl.get_QuorumResource)
        CallbackFree(this.vtbl.get_QuorumLogSize)
        CallbackFree(this.vtbl.put_QuorumLogSize)
        CallbackFree(this.vtbl.get_QuorumPath)
        CallbackFree(this.vtbl.put_QuorumPath)
        CallbackFree(this.vtbl.get_Nodes)
        CallbackFree(this.vtbl.get_ResourceGroups)
        CallbackFree(this.vtbl.get_Resources)
        CallbackFree(this.vtbl.get_ResourceTypes)
        CallbackFree(this.vtbl.get_Networks)
        CallbackFree(this.vtbl.get_NetInterfaces)
    }
}
