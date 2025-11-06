#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISClusProperties.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISCluster.ahk
#Include .\ISClusResTypeResources.ahk
#Include .\ISClusResTypePossibleOwnerNodes.ahk
#Include .\ISClusDisks.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusResType extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusResType
     * @type {Guid}
     */
    static IID => Guid("{f2e60710-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommonProperties", "get_PrivateProperties", "get_CommonROProperties", "get_PrivateROProperties", "get_Name", "Delete", "get_Cluster", "get_Resources", "get_PossibleOwnerNodes", "get_AvailableDisks"]

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
        pbstrName := BSTR()
        result := ComCall(11, this, "ptr", pbstrName, "HRESULT")
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
}
