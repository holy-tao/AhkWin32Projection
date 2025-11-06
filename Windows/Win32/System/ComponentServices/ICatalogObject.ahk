#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents items in collections on the COM+ catalog. ICatalogObject enables you to get and put properties exposed by objects in the catalog.
 * @see https://docs.microsoft.com/windows/win32/api//comadmin/nn-comadmin-icatalogobject
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICatalogObject extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICatalogObject
     * @type {Guid}
     */
    static IID => Guid("{6eb22871-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Value", "put_Value", "get_Key", "get_Name", "IsPropertyReadOnly", "get_Valid", "IsPropertyWriteOnly"]

    /**
     * 
     * @param {BSTR} bstrPropName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogobject-get_value
     */
    get_Value(bstrPropName) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        pvarRetVal := VARIANT()
        result := ComCall(7, this, "ptr", bstrPropName, "ptr", pvarRetVal, "HRESULT")
        return pvarRetVal
    }

    /**
     * 
     * @param {BSTR} bstrPropName 
     * @param {VARIANT} val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogobject-put_value
     */
    put_Value(bstrPropName, val) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(8, this, "ptr", bstrPropName, "ptr", val, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogobject-get_key
     */
    get_Key() {
        pvarRetVal := VARIANT()
        result := ComCall(9, this, "ptr", pvarRetVal, "HRESULT")
        return pvarRetVal
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogobject-get_name
     */
    get_Name() {
        pvarRetVal := VARIANT()
        result := ComCall(10, this, "ptr", pvarRetVal, "HRESULT")
        return pvarRetVal
    }

    /**
     * 
     * @param {BSTR} bstrPropName 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogobject-ispropertyreadonly
     */
    IsPropertyReadOnly(bstrPropName) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(11, this, "ptr", bstrPropName, "short*", &pbRetVal := 0, "HRESULT")
        return pbRetVal
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogobject-get_valid
     */
    get_Valid() {
        result := ComCall(12, this, "short*", &pbRetVal := 0, "HRESULT")
        return pbRetVal
    }

    /**
     * 
     * @param {BSTR} bstrPropName 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogobject-ispropertywriteonly
     */
    IsPropertyWriteOnly(bstrPropName) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(13, this, "ptr", bstrPropName, "short*", &pbRetVal := 0, "HRESULT")
        return pbRetVal
    }
}
