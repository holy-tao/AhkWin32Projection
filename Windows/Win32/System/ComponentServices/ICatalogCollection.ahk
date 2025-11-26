#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk
#Include ..\Variant\VARIANT.ahk

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
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {VARIANT} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AddEnabled {
        get => this.get_AddEnabled()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RemoveEnabled {
        get => this.get_RemoveEnabled()
    }

    /**
     * @type {Integer} 
     */
    DataStoreMajorVersion {
        get => this.get_DataStoreMajorVersion()
    }

    /**
     * @type {Integer} 
     */
    DataStoreMinorVersion {
        get => this.get_DataStoreMinorVersion()
    }

    /**
     * Retrieves an enumerator that can be used to iterate through the collection objects.
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppEnumVariant := 0, "HRESULT")
        return IUnknown(ppEnumVariant)
    }

    /**
     * Retrieves the item that correspond to the specified index.
     * @param {Integer} lIndex 
     * @returns {IDispatch} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogcollection-get_item
     */
    get_Item(lIndex) {
        result := ComCall(8, this, "int", lIndex, "ptr*", &ppCatalogObject := 0, "HRESULT")
        return IDispatch(ppCatalogObject)
    }

    /**
     * Retrieves the number of items in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogcollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plObjectCount := 0, "HRESULT")
        return plObjectCount
    }

    /**
     * Removes an item from the collection, given its index, and re-indexes the items with higher index values.
     * @param {Integer} lIndex The zero-based index of the item to be removed.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogcollection-remove
     */
    Remove(lIndex) {
        result := ComCall(10, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * Adds an item to the collection, giving it the high index value.
     * @returns {IDispatch} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nn-comadmin-icatalogobject">ICatalogObject</a> interface pointer for the new object.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogcollection-add
     */
    Add() {
        result := ComCall(11, this, "ptr*", &ppCatalogObject := 0, "HRESULT")
        return IDispatch(ppCatalogObject)
    }

    /**
     * Populates the collection with data for all items contained in the collection.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_OBJECTERRORS </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors occurred while accessing one or more objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogcollection-populate
     */
    Populate() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Saves all pending changes made to the collection and the items it contains to the COM+ catalog data store.
     * @returns {Integer} The number of changes to the collection that are being attempted; if no changes are pending, the value is zero. If some changes fail, this returned value does not reflect the failure; it is still the number of changes attempted.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogcollection-savechanges
     */
    SaveChanges() {
        result := ComCall(13, this, "int*", &pcChanges := 0, "HRESULT")
        return pcChanges
    }

    /**
     * Retrieves a collection from the COM+ catalog that is related to the current collection.
     * @param {BSTR} bstrCollName The name of the collection to be retrieved.
     * @param {VARIANT} varObjectKey The <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icatalogobject-get_key">Key</a> property value of the parent item of the collection to be retrieved.
     * @returns {IDispatch} The <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nn-comadmin-icatalogcollection">ICatalogCollection</a> interface for the retrieved collection.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogcollection-getcollection
     */
    GetCollection(bstrCollName, varObjectKey) {
        bstrCollName := bstrCollName is String ? BSTR.Alloc(bstrCollName).Value : bstrCollName

        result := ComCall(14, this, "ptr", bstrCollName, "ptr", varObjectKey, "ptr*", &ppCatalogCollection := 0, "HRESULT")
        return IDispatch(ppCatalogCollection)
    }

    /**
     * Retrieves the name of the collection.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogcollection-get_name
     */
    get_Name() {
        pVarNamel := VARIANT()
        result := ComCall(15, this, "ptr", pVarNamel, "HRESULT")
        return pVarNamel
    }

    /**
     * Indicates whether the Add method is enabled for the collection.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogcollection-get_addenabled
     */
    get_AddEnabled() {
        result := ComCall(16, this, "short*", &pVarBool := 0, "HRESULT")
        return pVarBool
    }

    /**
     * Indicates whether the Remove method is enabled for the collection.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogcollection-get_removeenabled
     */
    get_RemoveEnabled() {
        result := ComCall(17, this, "short*", &pVarBool := 0, "HRESULT")
        return pVarBool
    }

    /**
     * Retrieves the utility interface for the collection.
     * @returns {IDispatch} The utility interface.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogcollection-getutilinterface
     */
    GetUtilInterface() {
        result := ComCall(18, this, "ptr*", &ppIDispatch := 0, "HRESULT")
        return IDispatch(ppIDispatch)
    }

    /**
     * Retrieves the major version number of the catalog data store.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogcollection-get_datastoremajorversion
     */
    get_DataStoreMajorVersion() {
        result := ComCall(19, this, "int*", &plMajorVersion := 0, "HRESULT")
        return plMajorVersion
    }

    /**
     * Retrieves the minor version number of the catalog data store.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogcollection-get_datastoreminorversion
     */
    get_DataStoreMinorVersion() {
        result := ComCall(20, this, "int*", &plMinorVersionl := 0, "HRESULT")
        return plMinorVersionl
    }

    /**
     * Populates a selected list of items in the collection from the COM+ catalog, based on the specified keys.
     * @param {Pointer<SAFEARRAY>} psaKeys The <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icatalogobject-get_key">Key</a> property value of the objects for which data is to be read.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_OBJECTERRORS </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors occurred while accessing one or more objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogcollection-populatebykey
     */
    PopulateByKey(psaKeys) {
        result := ComCall(21, this, "ptr", psaKeys, "HRESULT")
        return result
    }

    /**
     * Reserved for future use.
     * @param {BSTR} bstrQueryString 
     * @param {Integer} lQueryType 
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_OBJECTERRORS </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors occurred while accessing one or more objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogcollection-populatebyquery
     */
    PopulateByQuery(bstrQueryString, lQueryType) {
        bstrQueryString := bstrQueryString is String ? BSTR.Alloc(bstrQueryString).Value : bstrQueryString

        result := ComCall(22, this, "ptr", bstrQueryString, "int", lQueryType, "HRESULT")
        return result
    }
}
