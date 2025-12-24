#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISClusProperties.ahk
#Include .\ISClusNode.ahk
#Include .\ISClusResGroupResources.ahk
#Include .\ISClusResGroupPreferredOwnerNodes.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ISCluster.ahk
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
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {ISClusNode} 
     */
    OwnerNode {
        get => this.get_OwnerNode()
    }

    /**
     * @type {ISClusResGroupResources} 
     */
    Resources {
        get => this.get_Resources()
    }

    /**
     * @type {ISClusResGroupPreferredOwnerNodes} 
     */
    PreferredOwnerNodes {
        get => this.get_PreferredOwnerNodes()
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
        pbstrName := BSTR()
        result := ComCall(12, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
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
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(14, this, "int*", &dwState := 0, "HRESULT")
        return dwState
    }

    /**
     * 
     * @returns {ISClusNode} 
     */
    get_OwnerNode() {
        result := ComCall(15, this, "ptr*", &ppOwnerNode := 0, "HRESULT")
        return ISClusNode(ppOwnerNode)
    }

    /**
     * 
     * @returns {ISClusResGroupResources} 
     */
    get_Resources() {
        result := ComCall(16, this, "ptr*", &ppClusterGroupResources := 0, "HRESULT")
        return ISClusResGroupResources(ppClusterGroupResources)
    }

    /**
     * 
     * @returns {ISClusResGroupPreferredOwnerNodes} 
     */
    get_PreferredOwnerNodes() {
        result := ComCall(17, this, "ptr*", &ppOwnerNodes := 0, "HRESULT")
        return ISClusResGroupPreferredOwnerNodes(ppOwnerNodes)
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
     * @returns {VARIANT} 
     */
    Online(varTimeout, varNode) {
        pvarPending := VARIANT()
        result := ComCall(19, this, "ptr", varTimeout, "ptr", varNode, "ptr", pvarPending, "HRESULT")
        return pvarPending
    }

    /**
     * 
     * @param {VARIANT} varTimeout 
     * @param {VARIANT} varNode 
     * @returns {VARIANT} 
     */
    Move(varTimeout, varNode) {
        pvarPending := VARIANT()
        result := ComCall(20, this, "ptr", varTimeout, "ptr", varNode, "ptr", pvarPending, "HRESULT")
        return pvarPending
    }

    /**
     * 
     * @param {VARIANT} varTimeout 
     * @returns {VARIANT} 
     */
    Offline(varTimeout) {
        pvarPending := VARIANT()
        result := ComCall(21, this, "ptr", varTimeout, "ptr", pvarPending, "HRESULT")
        return pvarPending
    }

    /**
     * 
     * @returns {ISCluster} 
     */
    get_Cluster() {
        result := ComCall(22, this, "ptr*", &ppCluster := 0, "HRESULT")
        return ISCluster(ppCluster)
    }
}
