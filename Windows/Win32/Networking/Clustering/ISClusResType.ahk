#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(11, this, "ptr", pbstrName, "HRESULT")
        return result
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
     * @param {Pointer<ISCluster>} ppCluster 
     * @returns {HRESULT} 
     */
    get_Cluster(ppCluster) {
        result := ComCall(13, this, "ptr*", ppCluster, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResTypeResources>} ppClusterResTypeResources 
     * @returns {HRESULT} 
     */
    get_Resources(ppClusterResTypeResources) {
        result := ComCall(14, this, "ptr*", ppClusterResTypeResources, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResTypePossibleOwnerNodes>} ppOwnerNodes 
     * @returns {HRESULT} 
     */
    get_PossibleOwnerNodes(ppOwnerNodes) {
        result := ComCall(15, this, "ptr*", ppOwnerNodes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusDisks>} ppAvailableDisks 
     * @returns {HRESULT} 
     */
    get_AvailableDisks(ppAvailableDisks) {
        result := ComCall(16, this, "ptr*", ppAvailableDisks, "HRESULT")
        return result
    }
}
