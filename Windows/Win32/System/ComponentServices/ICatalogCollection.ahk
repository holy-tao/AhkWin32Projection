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
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppEnumVariant := 0, "HRESULT")
        return IUnknown(ppEnumVariant)
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-get_item
     */
    get_Item(lIndex) {
        result := ComCall(8, this, "int", lIndex, "ptr*", &ppCatalogObject := 0, "HRESULT")
        return IDispatch(ppCatalogObject)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plObjectCount := 0, "HRESULT")
        return plObjectCount
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
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-add
     */
    Add() {
        result := ComCall(11, this, "ptr*", &ppCatalogObject := 0, "HRESULT")
        return IDispatch(ppCatalogObject)
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-savechanges
     */
    SaveChanges() {
        result := ComCall(13, this, "int*", &pcChanges := 0, "HRESULT")
        return pcChanges
    }

    /**
     * 
     * @param {BSTR} bstrCollName 
     * @param {VARIANT} varObjectKey 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-getcollection
     */
    GetCollection(bstrCollName, varObjectKey) {
        bstrCollName := bstrCollName is String ? BSTR.Alloc(bstrCollName).Value : bstrCollName

        result := ComCall(14, this, "ptr", bstrCollName, "ptr", varObjectKey, "ptr*", &ppCatalogCollection := 0, "HRESULT")
        return IDispatch(ppCatalogCollection)
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-get_name
     */
    get_Name() {
        pVarNamel := VARIANT()
        result := ComCall(15, this, "ptr", pVarNamel, "HRESULT")
        return pVarNamel
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-get_addenabled
     */
    get_AddEnabled() {
        result := ComCall(16, this, "short*", &pVarBool := 0, "HRESULT")
        return pVarBool
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-get_removeenabled
     */
    get_RemoveEnabled() {
        result := ComCall(17, this, "short*", &pVarBool := 0, "HRESULT")
        return pVarBool
    }

    /**
     * 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-getutilinterface
     */
    GetUtilInterface() {
        result := ComCall(18, this, "ptr*", &ppIDispatch := 0, "HRESULT")
        return IDispatch(ppIDispatch)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-get_datastoremajorversion
     */
    get_DataStoreMajorVersion() {
        result := ComCall(19, this, "int*", &plMajorVersion := 0, "HRESULT")
        return plMajorVersion
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogcollection-get_datastoreminorversion
     */
    get_DataStoreMinorVersion() {
        result := ComCall(20, this, "int*", &plMinorVersionl := 0, "HRESULT")
        return plMinorVersionl
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
