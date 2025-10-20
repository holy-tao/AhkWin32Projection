#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusResGroups extends IDispatch{
    /**
     * The interface identifier for ISClusResGroups
     * @type {Guid}
     */
    static IID => Guid("{f2e60708-2631-11d1-89f1-00a0c90d061e}")

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
     * @param {Pointer<ISClusResGroup>} ppClusResGroup 
     * @returns {HRESULT} 
     */
    get_Item(varIndex, ppClusResGroup) {
        result := ComCall(10, this, "ptr", varIndex, "ptr", ppClusResGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrResourceGroupName 
     * @param {Pointer<ISClusResGroup>} ppResourceGroup 
     * @returns {HRESULT} 
     */
    CreateItem(bstrResourceGroupName, ppResourceGroup) {
        bstrResourceGroupName := bstrResourceGroupName is String ? BSTR.Alloc(bstrResourceGroupName).Value : bstrResourceGroupName

        result := ComCall(11, this, "ptr", bstrResourceGroupName, "ptr", ppResourceGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {HRESULT} 
     */
    DeleteItem(varIndex) {
        result := ComCall(12, this, "ptr", varIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
