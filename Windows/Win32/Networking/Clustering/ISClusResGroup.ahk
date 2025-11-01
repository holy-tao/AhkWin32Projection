#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusResGroup extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusResGroup
     * @type {Guid}
     */
    static IID => Guid("{f2e60706-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommonProperties", "get_PrivateProperties", "get_CommonROProperties", "get_PrivateROProperties", "get_Handle", "get_Name", "put_Name", "get_State", "get_OwnerNode", "get_Resources", "get_PreferredOwnerNodes", "Delete", "Online", "Move", "Offline", "get_Cluster"]

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
        phandleMarshal := phandle is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, phandleMarshal, phandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(12, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @returns {HRESULT} 
     */
    put_Name(bstrGroupName) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(13, this, "ptr", bstrGroupName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} dwState 
     * @returns {HRESULT} 
     */
    get_State(dwState) {
        dwStateMarshal := dwState is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, dwStateMarshal, dwState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusNode>} ppOwnerNode 
     * @returns {HRESULT} 
     */
    get_OwnerNode(ppOwnerNode) {
        result := ComCall(15, this, "ptr*", ppOwnerNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResGroupResources>} ppClusterGroupResources 
     * @returns {HRESULT} 
     */
    get_Resources(ppClusterGroupResources) {
        result := ComCall(16, this, "ptr*", ppClusterGroupResources, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResGroupPreferredOwnerNodes>} ppOwnerNodes 
     * @returns {HRESULT} 
     */
    get_PreferredOwnerNodes(ppOwnerNodes) {
        result := ComCall(17, this, "ptr*", ppOwnerNodes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varTimeout 
     * @param {VARIANT} varNode 
     * @param {Pointer<VARIANT>} pvarPending 
     * @returns {HRESULT} 
     */
    Online(varTimeout, varNode, pvarPending) {
        result := ComCall(19, this, "ptr", varTimeout, "ptr", varNode, "ptr", pvarPending, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varTimeout 
     * @param {VARIANT} varNode 
     * @param {Pointer<VARIANT>} pvarPending 
     * @returns {HRESULT} 
     */
    Move(varTimeout, varNode, pvarPending) {
        result := ComCall(20, this, "ptr", varTimeout, "ptr", varNode, "ptr", pvarPending, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varTimeout 
     * @param {Pointer<VARIANT>} pvarPending 
     * @returns {HRESULT} 
     */
    Offline(varTimeout, pvarPending) {
        result := ComCall(21, this, "ptr", varTimeout, "ptr", pvarPending, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISCluster>} ppCluster 
     * @returns {HRESULT} 
     */
    get_Cluster(ppCluster) {
        result := ComCall(22, this, "ptr*", ppCluster, "HRESULT")
        return result
    }
}
