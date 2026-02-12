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
        result := ComCall(7, this, "ptr*", &ppProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_PrivateProperties() {
        result := ComCall(8, this, "ptr*", &ppProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_CommonROProperties() {
        result := ComCall(9, this, "ptr*", &ppProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_PrivateROProperties() {
        result := ComCall(10, this, "ptr*", &ppProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_Handle() {
        result := ComCall(11, this, "ptr*", &phandle := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phandle
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(12, this, "ptr", pbstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @returns {HRESULT} 
     */
    put_Name(bstrGroupName) {
        if(bstrGroupName is String) {
            pin := BSTR.Alloc(bstrGroupName)
            bstrGroupName := pin.Value
        }

        result := ComCall(13, this, "ptr", bstrGroupName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(14, this, "int*", &dwState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return dwState
    }

    /**
     * 
     * @returns {ISClusNode} 
     */
    get_OwnerNode() {
        result := ComCall(15, this, "ptr*", &ppOwnerNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusNode(ppOwnerNode)
    }

    /**
     * 
     * @returns {ISClusResGroupResources} 
     */
    get_Resources() {
        result := ComCall(16, this, "ptr*", &ppClusterGroupResources := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusResGroupResources(ppClusterGroupResources)
    }

    /**
     * 
     * @returns {ISClusResGroupPreferredOwnerNodes} 
     */
    get_PreferredOwnerNodes() {
        result := ComCall(17, this, "ptr*", &ppOwnerNodes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusResGroupPreferredOwnerNodes(ppOwnerNodes)
    }

    /**
     * Delete Method (ADOX Collections)
     * @remarks
     * An error will occur if the *Name* does not exist in the collection.  
     *   
     *  For [Tables](./tables-collection-adox.md) and [Users](./users-collection-adox.md) collections, an error will occur if the provider does not support deleting tables or users, respectively. For [Procedures](./procedures-collection-adox.md) and [Views](./views-collection-adox.md) collections, **Delete** will fail if the provider does not support persisting commands.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/delete-method-adox-collections
     */
    Delete() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Brings a group online. (OnlineClusterGroup)
     * @remarks
     * If the group cannot be brought online on the node identified by the <i>hDestinationNode</i> parameter, the  <b>OnlineClusterGroup</b> function fails.
     * 
     * If the <i>hDestinationNode</i> parameter is set to <b>NULL</b>,  <b>OnlineClusterGroup</b> brings the group online on the current node.
     * 
     * Do not call  <b>OnlineClusterGroup</b> from a resource DLL. For more information, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/function-calls-to-avoid-in-resource-dlls">Function Calls to Avoid in Resource DLLs</a>.
     * 
     * Do not pass LPC and RPC handles to the same function call. Otherwise, the call will raise an RPC exception and can have additional destructive effects. For information on how LPC and RPC handles are created, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/using-object-handles">Using Object Handles</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-opencluster">OpenCluster</a>.
     * @param {VARIANT} varTimeout 
     * @param {VARIANT} varNode 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/clusapi/nf-clusapi-onlineclustergroup
     */
    Online(varTimeout, varNode) {
        pvarPending := VARIANT()
        result := ComCall(19, this, "ptr", varTimeout, "ptr", varNode, "ptr", pvarPending, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarPending
    }

    /**
     * Move Method Example (VC++)
     * @param {VARIANT} varTimeout 
     * @param {VARIANT} varNode 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/move-method-example-vc
     */
    Move(varTimeout, varNode) {
        pvarPending := VARIANT()
        result := ComCall(20, this, "ptr", varTimeout, "ptr", varNode, "ptr", pvarPending, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarPending
    }

    /**
     * Takes a group offline.
     * @remarks
     * Do not call  <b>OfflineClusterGroup</b> from a resource DLL. For more information, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/function-calls-to-avoid-in-resource-dlls">Function Calls to Avoid in Resource DLLs</a>.
     * @param {VARIANT} varTimeout 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/clusapi/nf-clusapi-offlineclustergroup
     */
    Offline(varTimeout) {
        pvarPending := VARIANT()
        result := ComCall(21, this, "ptr", varTimeout, "ptr", pvarPending, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarPending
    }

    /**
     * 
     * @returns {ISCluster} 
     */
    get_Cluster() {
        result := ComCall(22, this, "ptr*", &ppCluster := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISCluster(ppCluster)
    }
}
