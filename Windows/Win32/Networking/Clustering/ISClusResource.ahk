#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusResource extends IDispatch{
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
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(12, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrResourceName 
     * @returns {HRESULT} 
     */
    put_Name(bstrResourceName) {
        bstrResourceName := bstrResourceName is String ? BSTR.Alloc(bstrResourceName).Value : bstrResourceName

        result := ComCall(13, this, "ptr", bstrResourceName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} dwState 
     * @returns {HRESULT} 
     */
    get_State(dwState) {
        result := ComCall(14, this, "int*", dwState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} dwCoreFlag 
     * @returns {HRESULT} 
     */
    get_CoreFlag(dwCoreFlag) {
        result := ComCall(15, this, "int*", dwCoreFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDevicePath 
     * @param {Integer} lMaxLogSize 
     * @returns {HRESULT} 
     */
    BecomeQuorumResource(bstrDevicePath, lMaxLogSize) {
        bstrDevicePath := bstrDevicePath is String ? BSTR.Alloc(bstrDevicePath).Value : bstrDevicePath

        result := ComCall(16, this, "ptr", bstrDevicePath, "int", lMaxLogSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Fail() {
        result := ComCall(18, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nTimeout 
     * @param {Pointer<VARIANT>} pvarPending 
     * @returns {HRESULT} 
     */
    Online(nTimeout, pvarPending) {
        result := ComCall(19, this, "int", nTimeout, "ptr", pvarPending, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nTimeout 
     * @param {Pointer<VARIANT>} pvarPending 
     * @returns {HRESULT} 
     */
    Offline(nTimeout, pvarPending) {
        result := ComCall(20, this, "int", nTimeout, "ptr", pvarPending, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResGroup>} pResourceGroup 
     * @returns {HRESULT} 
     */
    ChangeResourceGroup(pResourceGroup) {
        result := ComCall(21, this, "ptr", pResourceGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusNode>} pNode 
     * @returns {HRESULT} 
     */
    AddResourceNode(pNode) {
        result := ComCall(22, this, "ptr", pNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusNode>} pNode 
     * @returns {HRESULT} 
     */
    RemoveResourceNode(pNode) {
        result := ComCall(23, this, "ptr", pNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Determines if one resource can be dependent upon another resource.
     * @param {Pointer<ISClusResource>} pResource 
     * @param {Pointer<VARIANT>} pvarDependent 
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource identified by <i>hResource</i> can depend on the resource identified by <i>hResourceDependent</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource identified by <i>hResource</i> cannot depend on the resource identified by <i>hResourceDependent</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-canresourcebedependent
     */
    CanResourceBeDependent(pResource, pvarDependent) {
        result := ComCall(24, this, "ptr", pResource, "ptr", pvarDependent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResPossibleOwnerNodes>} ppOwnerNodes 
     * @returns {HRESULT} 
     */
    get_PossibleOwnerNodes(ppOwnerNodes) {
        result := ComCall(25, this, "ptr", ppOwnerNodes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResDependencies>} ppResDependencies 
     * @returns {HRESULT} 
     */
    get_Dependencies(ppResDependencies) {
        result := ComCall(26, this, "ptr", ppResDependencies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResDependents>} ppResDependents 
     * @returns {HRESULT} 
     */
    get_Dependents(ppResDependents) {
        result := ComCall(27, this, "ptr", ppResDependents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResGroup>} ppResGroup 
     * @returns {HRESULT} 
     */
    get_Group(ppResGroup) {
        result := ComCall(28, this, "ptr", ppResGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusNode>} ppOwnerNode 
     * @returns {HRESULT} 
     */
    get_OwnerNode(ppOwnerNode) {
        result := ComCall(29, this, "ptr", ppOwnerNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISCluster>} ppCluster 
     * @returns {HRESULT} 
     */
    get_Cluster(ppCluster) {
        result := ComCall(30, this, "ptr", ppCluster, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} prcClassInfo 
     * @returns {HRESULT} 
     */
    get_ClassInfo(prcClassInfo) {
        result := ComCall(31, this, "int*", prcClassInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusDisk>} ppDisk 
     * @returns {HRESULT} 
     */
    get_Disk(ppDisk) {
        result := ComCall(32, this, "ptr", ppDisk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusRegistryKeys>} ppRegistryKeys 
     * @returns {HRESULT} 
     */
    get_RegistryKeys(ppRegistryKeys) {
        result := ComCall(33, this, "ptr", ppRegistryKeys, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusCryptoKeys>} ppCryptoKeys 
     * @returns {HRESULT} 
     */
    get_CryptoKeys(ppCryptoKeys) {
        result := ComCall(34, this, "ptr", ppCryptoKeys, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTypeName 
     * @returns {HRESULT} 
     */
    get_TypeName(pbstrTypeName) {
        result := ComCall(35, this, "ptr", pbstrTypeName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResType>} ppResourceType 
     * @returns {HRESULT} 
     */
    get_Type(ppResourceType) {
        result := ComCall(36, this, "ptr", ppResourceType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbMaintenanceMode 
     * @returns {HRESULT} 
     */
    get_MaintenanceMode(pbMaintenanceMode) {
        result := ComCall(37, this, "ptr", pbMaintenanceMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bMaintenanceMode 
     * @returns {HRESULT} 
     */
    put_MaintenanceMode(bMaintenanceMode) {
        result := ComCall(38, this, "int", bMaintenanceMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
