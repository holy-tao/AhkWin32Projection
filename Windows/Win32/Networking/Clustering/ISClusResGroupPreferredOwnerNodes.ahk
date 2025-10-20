#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusResGroupPreferredOwnerNodes extends IDispatch{
    /**
     * The interface identifier for ISClusResGroupPreferredOwnerNodes
     * @type {Guid}
     */
    static IID => Guid("{f2e606e8-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        result := ComCall(7, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     */
    get__NewEnum(retval) {
        result := ComCall(8, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @param {Pointer<ISClusNode>} ppNode 
     * @returns {HRESULT} 
     */
    get_Item(varIndex, ppNode) {
        result := ComCall(10, this, "ptr", varIndex, "ptr", ppNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusNode>} pNode 
     * @param {Integer} nPosition 
     * @returns {HRESULT} 
     */
    InsertItem(pNode, nPosition) {
        result := ComCall(11, this, "ptr", pNode, "int", nPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {HRESULT} 
     */
    RemoveItem(varIndex) {
        result := ComCall(12, this, "ptr", varIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarModified 
     * @returns {HRESULT} 
     */
    get_Modified(pvarModified) {
        result := ComCall(13, this, "ptr", pvarModified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SaveChanges() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusNode>} pNode 
     * @returns {HRESULT} 
     */
    AddItem(pNode) {
        result := ComCall(15, this, "ptr", pNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
