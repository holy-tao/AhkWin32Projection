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
     * @param {BSTR} bstrGroupName 
     * @returns {HRESULT} 
     */
    put_Name(bstrGroupName) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(13, this, "ptr", bstrGroupName, "int")
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
     * @param {Pointer<ISClusNode>} ppOwnerNode 
     * @returns {HRESULT} 
     */
    get_OwnerNode(ppOwnerNode) {
        result := ComCall(15, this, "ptr", ppOwnerNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResGroupResources>} ppClusterGroupResources 
     * @returns {HRESULT} 
     */
    get_Resources(ppClusterGroupResources) {
        result := ComCall(16, this, "ptr", ppClusterGroupResources, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusResGroupPreferredOwnerNodes>} ppOwnerNodes 
     * @returns {HRESULT} 
     */
    get_PreferredOwnerNodes(ppOwnerNodes) {
        result := ComCall(17, this, "ptr", ppOwnerNodes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(18, this, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(19, this, "ptr", varTimeout, "ptr", varNode, "ptr", pvarPending, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(20, this, "ptr", varTimeout, "ptr", varNode, "ptr", pvarPending, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varTimeout 
     * @param {Pointer<VARIANT>} pvarPending 
     * @returns {HRESULT} 
     */
    Offline(varTimeout, pvarPending) {
        result := ComCall(21, this, "ptr", varTimeout, "ptr", pvarPending, "int")
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
        result := ComCall(22, this, "ptr", ppCluster, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
