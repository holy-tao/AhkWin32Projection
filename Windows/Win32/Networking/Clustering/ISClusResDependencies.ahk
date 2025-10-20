#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusResDependencies extends IDispatch{
    /**
     * The interface identifier for ISClusResDependencies
     * @type {Guid}
     */
    static IID => Guid("{f2e60704-2631-11d1-89f1-00a0c90d061e}")

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
     * @param {Pointer<ISClusResource>} ppClusResource 
     * @returns {HRESULT} 
     */
    get_Item(varIndex, ppClusResource) {
        result := ComCall(10, this, "ptr", varIndex, "ptr", ppClusResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrResourceName 
     * @param {BSTR} bstrResourceType 
     * @param {Integer} dwFlags 
     * @param {Pointer<ISClusResource>} ppClusterResource 
     * @returns {HRESULT} 
     */
    CreateItem(bstrResourceName, bstrResourceType, dwFlags, ppClusterResource) {
        bstrResourceName := bstrResourceName is String ? BSTR.Alloc(bstrResourceName).Value : bstrResourceName
        bstrResourceType := bstrResourceType is String ? BSTR.Alloc(bstrResourceType).Value : bstrResourceType

        result := ComCall(11, this, "ptr", bstrResourceName, "ptr", bstrResourceType, "int", dwFlags, "ptr", ppClusterResource, "int")
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

    /**
     * 
     * @param {Pointer<ISClusResource>} pResource 
     * @returns {HRESULT} 
     */
    AddItem(pResource) {
        result := ComCall(13, this, "ptr", pResource, "int")
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
        result := ComCall(14, this, "ptr", varIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
