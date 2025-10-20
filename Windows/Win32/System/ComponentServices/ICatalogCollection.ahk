#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents any collection in the COM+ catalog. ICatalogCollection enables you to enumerate, add, remove, and retrieve items in a collection and to access related collections.
 * @see https://docs.microsoft.com/windows/win32/api//comadmin/nn-comadmin-icatalogcollection
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICatalogCollection extends IDispatch{
    /**
     * The interface identifier for ICatalogCollection
     * @type {Guid}
     */
    static IID => Guid("{6eb22872-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnumVariant 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppEnumVariant) {
        result := ComCall(7, this, "ptr", ppEnumVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<IDispatch>} ppCatalogObject 
     * @returns {HRESULT} 
     */
    get_Item(lIndex, ppCatalogObject) {
        result := ComCall(8, this, "int", lIndex, "ptr", ppCatalogObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plObjectCount 
     * @returns {HRESULT} 
     */
    get_Count(plObjectCount) {
        result := ComCall(9, this, "int*", plObjectCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     */
    Remove(lIndex) {
        result := ComCall(10, this, "int", lIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppCatalogObject 
     * @returns {HRESULT} 
     */
    Add(ppCatalogObject) {
        result := ComCall(11, this, "ptr", ppCatalogObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Populate() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pcChanges 
     * @returns {HRESULT} 
     */
    SaveChanges(pcChanges) {
        result := ComCall(13, this, "int*", pcChanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCollName 
     * @param {VARIANT} varObjectKey 
     * @param {Pointer<IDispatch>} ppCatalogCollection 
     * @returns {HRESULT} 
     */
    GetCollection(bstrCollName, varObjectKey, ppCatalogCollection) {
        bstrCollName := bstrCollName is String ? BSTR.Alloc(bstrCollName).Value : bstrCollName

        result := ComCall(14, this, "ptr", bstrCollName, "ptr", varObjectKey, "ptr", ppCatalogCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVarNamel 
     * @returns {HRESULT} 
     */
    get_Name(pVarNamel) {
        result := ComCall(15, this, "ptr", pVarNamel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVarBool 
     * @returns {HRESULT} 
     */
    get_AddEnabled(pVarBool) {
        result := ComCall(16, this, "ptr", pVarBool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVarBool 
     * @returns {HRESULT} 
     */
    get_RemoveEnabled(pVarBool) {
        result := ComCall(17, this, "ptr", pVarBool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppIDispatch 
     * @returns {HRESULT} 
     */
    GetUtilInterface(ppIDispatch) {
        result := ComCall(18, this, "ptr", ppIDispatch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMajorVersion 
     * @returns {HRESULT} 
     */
    get_DataStoreMajorVersion(plMajorVersion) {
        result := ComCall(19, this, "int*", plMajorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMinorVersionl 
     * @returns {HRESULT} 
     */
    get_DataStoreMinorVersion(plMinorVersionl) {
        result := ComCall(20, this, "int*", plMinorVersionl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} psaKeys 
     * @returns {HRESULT} 
     */
    PopulateByKey(psaKeys) {
        result := ComCall(21, this, "ptr", psaKeys, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrQueryString 
     * @param {Integer} lQueryType 
     * @returns {HRESULT} 
     */
    PopulateByQuery(bstrQueryString, lQueryType) {
        bstrQueryString := bstrQueryString is String ? BSTR.Alloc(bstrQueryString).Value : bstrQueryString

        result := ComCall(22, this, "ptr", bstrQueryString, "int", lQueryType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
