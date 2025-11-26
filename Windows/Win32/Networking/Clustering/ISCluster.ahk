#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISClusProperties.ahk
#Include .\ISClusVersion.ahk
#Include .\ISClusResource.ahk
#Include .\ISClusNodes.ahk
#Include .\ISClusResGroups.ahk
#Include .\ISClusResources.ahk
#Include .\ISClusResTypes.ahk
#Include .\ISClusNetworks.ahk
#Include .\ISClusNetInterfaces.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISCluster extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCluster
     * @type {Guid}
     */
    static IID => Guid("{f2e606e4-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommonProperties", "get_PrivateProperties", "get_CommonROProperties", "get_PrivateROProperties", "get_Handle", "Open", "get_Name", "put_Name", "get_Version", "put_QuorumResource", "get_QuorumResource", "get_QuorumLogSize", "put_QuorumLogSize", "get_QuorumPath", "put_QuorumPath", "get_Nodes", "get_ResourceGroups", "get_Resources", "get_ResourceTypes", "get_Networks", "get_NetInterfaces"]

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

        result := ComCall(12, this, "ptr", bstrClusterName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(13, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrClusterName 
     * @returns {HRESULT} 
     */
    put_Name(bstrClusterName) {
        bstrClusterName := bstrClusterName is String ? BSTR.Alloc(bstrClusterName).Value : bstrClusterName

        result := ComCall(14, this, "ptr", bstrClusterName, "HRESULT")
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
        ppPath := BSTR()
        result := ComCall(20, this, "ptr", ppPath, "HRESULT")
        return ppPath
    }

    /**
     * 
     * @param {BSTR} pPath 
     * @returns {HRESULT} 
     */
    put_QuorumPath(pPath) {
        pPath := pPath is String ? BSTR.Alloc(pPath).Value : pPath

        result := ComCall(21, this, "ptr", pPath, "HRESULT")
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
}
