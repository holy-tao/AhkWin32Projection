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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "Remove", "Add", "Populate", "SaveChanges", "GetCollection", "get_Name", "get_AddEnabled", "get_RemoveEnabled", "GetUtilInterface", "get_DataStoreMajorVersion", "get_DataStoreMinorVersion", "PopulateByKey", "PopulateByQuery"]

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnumVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-get__newenum
     */
    get__NewEnum(ppEnumVariant) {
        result := ComCall(7, this, "ptr*", ppEnumVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<IDispatch>} ppCatalogObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-get_item
     */
    get_Item(lIndex, ppCatalogObject) {
        result := ComCall(8, this, "int", lIndex, "ptr*", ppCatalogObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plObjectCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-get_count
     */
    get_Count(plObjectCount) {
        result := ComCall(9, this, "int*", plObjectCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-remove
     */
    Remove(lIndex) {
        result := ComCall(10, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppCatalogObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-add
     */
    Add(ppCatalogObject) {
        result := ComCall(11, this, "ptr*", ppCatalogObject, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-populate
     */
    Populate() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcChanges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-savechanges
     */
    SaveChanges(pcChanges) {
        result := ComCall(13, this, "int*", pcChanges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrCollName 
     * @param {VARIANT} varObjectKey 
     * @param {Pointer<IDispatch>} ppCatalogCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-getcollection
     */
    GetCollection(bstrCollName, varObjectKey, ppCatalogCollection) {
        bstrCollName := bstrCollName is String ? BSTR.Alloc(bstrCollName).Value : bstrCollName

        result := ComCall(14, this, "ptr", bstrCollName, "ptr", varObjectKey, "ptr*", ppCatalogCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVarNamel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-get_name
     */
    get_Name(pVarNamel) {
        result := ComCall(15, this, "ptr", pVarNamel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVarBool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-get_addenabled
     */
    get_AddEnabled(pVarBool) {
        result := ComCall(16, this, "ptr", pVarBool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVarBool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-get_removeenabled
     */
    get_RemoveEnabled(pVarBool) {
        result := ComCall(17, this, "ptr", pVarBool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppIDispatch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-getutilinterface
     */
    GetUtilInterface(ppIDispatch) {
        result := ComCall(18, this, "ptr*", ppIDispatch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMajorVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-get_datastoremajorversion
     */
    get_DataStoreMajorVersion(plMajorVersion) {
        result := ComCall(19, this, "int*", plMajorVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMinorVersionl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-get_datastoreminorversion
     */
    get_DataStoreMinorVersion(plMinorVersionl) {
        result := ComCall(20, this, "int*", plMinorVersionl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} psaKeys 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-populatebykey
     */
    PopulateByKey(psaKeys) {
        result := ComCall(21, this, "ptr", psaKeys, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrQueryString 
     * @param {Integer} lQueryType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-populatebyquery
     */
    PopulateByQuery(bstrQueryString, lQueryType) {
        bstrQueryString := bstrQueryString is String ? BSTR.Alloc(bstrQueryString).Value : bstrQueryString

        result := ComCall(22, this, "ptr", bstrQueryString, "int", lQueryType, "HRESULT")
        return result
    }
}
