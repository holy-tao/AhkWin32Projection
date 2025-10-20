#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<ISClusProperties>} ppProperties 
     * @returns {HRESULT} 
     */
    get_CommonProperties(ppProperties) {
        result := ComCall(7, this, "ptr*", ppProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusProperties>} ppProperties 
     * @returns {HRESULT} 
     */
    get_PrivateProperties(ppProperties) {
        result := ComCall(8, this, "ptr*", ppProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusProperties>} ppProperties 
     * @returns {HRESULT} 
     */
    get_CommonROProperties(ppProperties) {
        result := ComCall(9, this, "ptr*", ppProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusProperties>} ppProperties 
     * @returns {HRESULT} 
     */
    get_PrivateROProperties(ppProperties) {
        result := ComCall(10, this, "ptr*", ppProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} phandle 
     * @returns {HRESULT} 
     */
    get_Handle(phandle) {
        result := ComCall(11, this, "ptr*", phandle, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(13, this, "ptr", pbstrName, "HRESULT")
        return result
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
     * @param {Pointer<ISClusVersion>} ppClusVersion 
     * @returns {HRESULT} 
     */
    get_Version(ppClusVersion) {
        result := ComCall(15, this, "ptr*", ppClusVersion, "HRESULT")
        return result
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
     * @param {Pointer<ISClusResource>} pClusterResource 
     * @returns {HRESULT} 
     */
    get_QuorumResource(pClusterResource) {
        result := ComCall(17, this, "ptr*", pClusterResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnLogSize 
     * @returns {HRESULT} 
     */
    get_QuorumLogSize(pnLogSize) {
        result := ComCall(18, this, "int*", pnLogSize, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} ppPath 
     * @returns {HRESULT} 
     */
    get_QuorumPath(ppPath) {
        result := ComCall(20, this, "ptr", ppPath, "HRESULT")
        return result
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
     * @param {Pointer<ISClusNodes>} ppNodes 
     * @returns {HRESULT} 
     */
    get_Nodes(ppNodes) {
        result := ComCall(22, this, "ptr*", ppNodes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResGroups>} ppClusterResourceGroups 
     * @returns {HRESULT} 
     */
    get_ResourceGroups(ppClusterResourceGroups) {
        result := ComCall(23, this, "ptr*", ppClusterResourceGroups, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResources>} ppClusterResources 
     * @returns {HRESULT} 
     */
    get_Resources(ppClusterResources) {
        result := ComCall(24, this, "ptr*", ppClusterResources, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResTypes>} ppResourceTypes 
     * @returns {HRESULT} 
     */
    get_ResourceTypes(ppResourceTypes) {
        result := ComCall(25, this, "ptr*", ppResourceTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusNetworks>} ppNetworks 
     * @returns {HRESULT} 
     */
    get_Networks(ppNetworks) {
        result := ComCall(26, this, "ptr*", ppNetworks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusNetInterfaces>} ppNetInterfaces 
     * @returns {HRESULT} 
     */
    get_NetInterfaces(ppNetInterfaces) {
        result := ComCall(27, this, "ptr*", ppNetInterfaces, "HRESULT")
        return result
    }
}
