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
     * 
     * @param {Pointer<ISClusProperties>} ppProperties 
     * @returns {HRESULT} 
     */
    get_CommonProperties(ppProperties) {
        result := ComCall(7, this, "ptr", ppProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusProperties>} ppProperties 
     * @returns {HRESULT} 
     */
    get_PrivateProperties(ppProperties) {
        result := ComCall(8, this, "ptr", ppProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusProperties>} ppProperties 
     * @returns {HRESULT} 
     */
    get_CommonROProperties(ppProperties) {
        result := ComCall(9, this, "ptr", ppProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusProperties>} ppProperties 
     * @returns {HRESULT} 
     */
    get_PrivateROProperties(ppProperties) {
        result := ComCall(10, this, "ptr", ppProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UIntPtr>} phandle 
     * @returns {HRESULT} 
     */
    get_Handle(phandle) {
        result := ComCall(11, this, "ptr*", phandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrClusterName 
     * @returns {HRESULT} 
     */
    Open(bstrClusterName) {
        bstrClusterName := bstrClusterName is String ? BSTR.Alloc(bstrClusterName).Value : bstrClusterName

        result := ComCall(12, this, "ptr", bstrClusterName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(13, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrClusterName 
     * @returns {HRESULT} 
     */
    put_Name(bstrClusterName) {
        bstrClusterName := bstrClusterName is String ? BSTR.Alloc(bstrClusterName).Value : bstrClusterName

        result := ComCall(14, this, "ptr", bstrClusterName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusVersion>} ppClusVersion 
     * @returns {HRESULT} 
     */
    get_Version(ppClusVersion) {
        result := ComCall(15, this, "ptr", ppClusVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResource>} pClusterResource 
     * @returns {HRESULT} 
     */
    put_QuorumResource(pClusterResource) {
        result := ComCall(16, this, "ptr", pClusterResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResource>} pClusterResource 
     * @returns {HRESULT} 
     */
    get_QuorumResource(pClusterResource) {
        result := ComCall(17, this, "ptr", pClusterResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnLogSize 
     * @returns {HRESULT} 
     */
    get_QuorumLogSize(pnLogSize) {
        result := ComCall(18, this, "int*", pnLogSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nLogSize 
     * @returns {HRESULT} 
     */
    put_QuorumLogSize(nLogSize) {
        result := ComCall(19, this, "int", nLogSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppPath 
     * @returns {HRESULT} 
     */
    get_QuorumPath(ppPath) {
        result := ComCall(20, this, "ptr", ppPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pPath 
     * @returns {HRESULT} 
     */
    put_QuorumPath(pPath) {
        pPath := pPath is String ? BSTR.Alloc(pPath).Value : pPath

        result := ComCall(21, this, "ptr", pPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusNodes>} ppNodes 
     * @returns {HRESULT} 
     */
    get_Nodes(ppNodes) {
        result := ComCall(22, this, "ptr", ppNodes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResGroups>} ppClusterResourceGroups 
     * @returns {HRESULT} 
     */
    get_ResourceGroups(ppClusterResourceGroups) {
        result := ComCall(23, this, "ptr", ppClusterResourceGroups, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResources>} ppClusterResources 
     * @returns {HRESULT} 
     */
    get_Resources(ppClusterResources) {
        result := ComCall(24, this, "ptr", ppClusterResources, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResTypes>} ppResourceTypes 
     * @returns {HRESULT} 
     */
    get_ResourceTypes(ppResourceTypes) {
        result := ComCall(25, this, "ptr", ppResourceTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusNetworks>} ppNetworks 
     * @returns {HRESULT} 
     */
    get_Networks(ppNetworks) {
        result := ComCall(26, this, "ptr", ppNetworks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusNetInterfaces>} ppNetInterfaces 
     * @returns {HRESULT} 
     */
    get_NetInterfaces(ppNetInterfaces) {
        result := ComCall(27, this, "ptr", ppNetInterfaces, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
