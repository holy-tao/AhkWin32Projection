#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISClusProperties.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ISClusResPossibleOwnerNodes.ahk
#Include .\ISClusResDependencies.ahk
#Include .\ISClusResDependents.ahk
#Include .\ISClusResGroup.ahk
#Include .\ISClusNode.ahk
#Include .\ISCluster.ahk
#Include .\ISClusDisk.ahk
#Include .\ISClusRegistryKeys.ahk
#Include .\ISClusCryptoKeys.ahk
#Include .\ISClusResType.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusResource extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommonProperties", "get_PrivateProperties", "get_CommonROProperties", "get_PrivateROProperties", "get_Handle", "get_Name", "put_Name", "get_State", "get_CoreFlag", "BecomeQuorumResource", "Delete", "Fail", "Online", "Offline", "ChangeResourceGroup", "AddResourceNode", "RemoveResourceNode", "CanResourceBeDependent", "get_PossibleOwnerNodes", "get_Dependencies", "get_Dependents", "get_Group", "get_OwnerNode", "get_Cluster", "get_ClassInfo", "get_Disk", "get_RegistryKeys", "get_CryptoKeys", "get_TypeName", "get_Type", "get_MaintenanceMode", "put_MaintenanceMode"]

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
        pbstrName := BSTR()
        result := ComCall(12, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrResourceName 
     * @returns {HRESULT} 
     */
    put_Name(bstrResourceName) {
        bstrResourceName := bstrResourceName is String ? BSTR.Alloc(bstrResourceName).Value : bstrResourceName

        result := ComCall(13, this, "ptr", bstrResourceName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(14, this, "int*", &dwState := 0, "HRESULT")
        return dwState
    }

    /**
     * 
     * @returns {Integer} 
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

        result := ComCall(16, this, "ptr", bstrDevicePath, "int", lMaxLogSize, "HRESULT")
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
        result := ComCall(19, this, "int", nTimeout, "ptr", pvarPending, "HRESULT")
        return pvarPending
    }

    /**
     * 
     * @param {Integer} nTimeout 
     * @returns {VARIANT} 
     */
    Offline(nTimeout) {
        pvarPending := VARIANT()
        result := ComCall(20, this, "int", nTimeout, "ptr", pvarPending, "HRESULT")
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
     * @param {ISClusResource} pResource 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-canresourcebedependent
     */
    CanResourceBeDependent(pResource) {
        pvarDependent := VARIANT()
        result := ComCall(24, this, "ptr", pResource, "ptr", pvarDependent, "HRESULT")
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
     * @returns {Integer} 
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
        pbstrTypeName := BSTR()
        result := ComCall(35, this, "ptr", pbstrTypeName, "HRESULT")
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
        result := ComCall(37, this, "int*", &pbMaintenanceMode := 0, "HRESULT")
        return pbMaintenanceMode
    }

    /**
     * 
     * @param {BOOL} bMaintenanceMode 
     * @returns {HRESULT} 
     */
    put_MaintenanceMode(bMaintenanceMode) {
        result := ComCall(38, this, "int", bMaintenanceMode, "HRESULT")
        return result
    }
}
