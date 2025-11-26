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
     * @type {VARIANT} 
     */
    Key {
        get => this.get_Key()
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
    Valid {
        get => this.get_Valid()
    }

    /**
     * Accesses the value of the specified property exposed by this catalog object.
     * @remarks
     * 
     * For information regarding properties exposed by catalog objects in each collection, see <a href="https://docs.microsoft.com/windows/desktop/cossdk/com--administration-collections">COM+ Administration Collections</a>.
     * 
     * 
     * @param {BSTR} bstrPropName 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogobject-get_value
     */
    get_Value(bstrPropName) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        pvarRetVal := VARIANT()
        result := ComCall(7, this, "ptr", bstrPropName, "ptr", pvarRetVal, "HRESULT")
        return pvarRetVal
    }

    /**
     * Accesses the value of the specified property exposed by this catalog object.
     * @remarks
     * 
     * For information regarding properties exposed by catalog objects in each collection, see <a href="https://docs.microsoft.com/windows/desktop/cossdk/com--administration-collections">COM+ Administration Collections</a>.
     * 
     * 
     * @param {BSTR} bstrPropName 
     * @param {VARIANT} val 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogobject-put_value
     */
    put_Value(bstrPropName, val) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(8, this, "ptr", bstrPropName, "ptr", val, "HRESULT")
        return result
    }

    /**
     * Retrieves the key property of the object.
     * @remarks
     * 
     * The key property serves as the primary identifier for a collection. In some cases, it is a GUID, such as CLSID for a component; in some cases, it is the object name, as with roles. The key property of a collection is identified in the documentation for each specific collection of the <a href="https://docs.microsoft.com/windows/desktop/cossdk/com--administration-collections">COM+ Administration Collections</a>.
     * 
     * If you add a new object and save it with the key property of an existing object, you overwrite the existing object.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogobject-get_key
     */
    get_Key() {
        pvarRetVal := VARIANT()
        result := ComCall(9, this, "ptr", pvarRetVal, "HRESULT")
        return pvarRetVal
    }

    /**
     * Retrieves the name property of the object.
     * @remarks
     * 
     * The name property of a collection is identified in the documentation for each specific collection of the <a href="https://docs.microsoft.com/windows/desktop/cossdk/com--administration-collections">COM+ Administration Collections</a>.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogobject-get_name
     */
    get_Name() {
        pvarRetVal := VARIANT()
        result := ComCall(10, this, "ptr", pvarRetVal, "HRESULT")
        return pvarRetVal
    }

    /**
     * Indicates whether the specified property can be modified using Value.
     * @param {BSTR} bstrPropName The name of the property to be modified.
     * @returns {VARIANT_BOOL} If this value is True, you cannot modify the property. Otherwise, you can modify the property.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogobject-ispropertyreadonly
     */
    IsPropertyReadOnly(bstrPropName) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(11, this, "ptr", bstrPropName, "short*", &pbRetVal := 0, "HRESULT")
        return pbRetVal
    }

    /**
     * Indicates whether all properties were successfully read from the catalog data store.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogobject-get_valid
     */
    get_Valid() {
        result := ComCall(12, this, "short*", &pbRetVal := 0, "HRESULT")
        return pbRetVal
    }

    /**
     * Indicates whether the specified property can be read using Value.
     * @param {BSTR} bstrPropName The name of the property to be read.
     * @returns {VARIANT_BOOL} If this value is True, you cannot read the property. Otherwise, you can read the property.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icatalogobject-ispropertywriteonly
     */
    IsPropertyWriteOnly(bstrPropName) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(13, this, "ptr", bstrPropName, "short*", &pbRetVal := 0, "HRESULT")
        return pbRetVal
    }
}
