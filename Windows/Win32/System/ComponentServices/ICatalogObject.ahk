#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Represents items in collections on the COM+ catalog. ICatalogObject enables you to get and put properties exposed by objects in the catalog.
 * @see https://learn.microsoft.com/windows/win32/api/comadmin/nn-comadmin-icatalogobject
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ICatalogObject extends IDispatch {
    /**
     * The interface identifier for ICatalogObject
     * @type {Guid}
     */
    static IID := Guid("{6eb22871-8a19-11d0-81b6-00a0c9231c29}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICatalogObject interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Value           : IntPtr
        put_Value           : IntPtr
        get_Key             : IntPtr
        get_Name            : IntPtr
        IsPropertyReadOnly  : IntPtr
        get_Valid           : IntPtr
        IsPropertyWriteOnly : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICatalogObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Accesses the value of the specified property exposed by this catalog object. (Get)
     * @remarks
     * For information regarding properties exposed by catalog objects in each collection, see <a href="https://docs.microsoft.com/windows/desktop/cossdk/com--administration-collections">COM+ Administration Collections</a>.
     * @param {BSTR} bstrPropName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogobject-get_value
     */
    get_Value(bstrPropName) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        pvarRetVal := VARIANT()
        result := ComCall(7, this, BSTR, bstrPropName, VARIANT.Ptr, pvarRetVal, "HRESULT")
        return pvarRetVal
    }

    /**
     * Accesses the value of the specified property exposed by this catalog object. (Put)
     * @remarks
     * For information regarding properties exposed by catalog objects in each collection, see <a href="https://docs.microsoft.com/windows/desktop/cossdk/com--administration-collections">COM+ Administration Collections</a>.
     * @param {BSTR} bstrPropName 
     * @param {VARIANT} _val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogobject-put_value
     */
    put_Value(bstrPropName, _val) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(8, this, BSTR, bstrPropName, VARIANT, _val, "HRESULT")
        return result
    }

    /**
     * Retrieves the key property of the object.
     * @remarks
     * The key property serves as the primary identifier for a collection. In some cases, it is a GUID, such as CLSID for a component; in some cases, it is the object name, as with roles. The key property of a collection is identified in the documentation for each specific collection of the <a href="https://docs.microsoft.com/windows/desktop/cossdk/com--administration-collections">COM+ Administration Collections</a>.
     * 
     * If you add a new object and save it with the key property of an existing object, you overwrite the existing object.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogobject-get_key
     */
    get_Key() {
        pvarRetVal := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, pvarRetVal, "HRESULT")
        return pvarRetVal
    }

    /**
     * Retrieves the name property of the object.
     * @remarks
     * The name property of a collection is identified in the documentation for each specific collection of the <a href="https://docs.microsoft.com/windows/desktop/cossdk/com--administration-collections">COM+ Administration Collections</a>.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogobject-get_name
     */
    get_Name() {
        pvarRetVal := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, pvarRetVal, "HRESULT")
        return pvarRetVal
    }

    /**
     * Indicates whether the specified property can be modified using Value.
     * @param {BSTR} bstrPropName The name of the property to be modified.
     * @returns {VARIANT_BOOL} If this value is True, you cannot modify the property. Otherwise, you can modify the property.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogobject-ispropertyreadonly
     */
    IsPropertyReadOnly(bstrPropName) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(11, this, BSTR, bstrPropName, VARIANT_BOOL.Ptr, &pbRetVal := 0, "HRESULT")
        return pbRetVal
    }

    /**
     * Indicates whether all properties were successfully read from the catalog data store.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogobject-get_valid
     */
    get_Valid() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &pbRetVal := 0, "HRESULT")
        return pbRetVal
    }

    /**
     * Indicates whether the specified property can be read using Value.
     * @param {BSTR} bstrPropName The name of the property to be read.
     * @returns {VARIANT_BOOL} If this value is True, you cannot read the property. Otherwise, you can read the property.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icatalogobject-ispropertywriteonly
     */
    IsPropertyWriteOnly(bstrPropName) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(13, this, BSTR, bstrPropName, VARIANT_BOOL.Ptr, &pbRetVal := 0, "HRESULT")
        return pbRetVal
    }

    Query(iid) {
        if (ICatalogObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 3)
        this.vtbl.put_Value := CallbackCreate(GetMethod(implObj, "put_Value"), flags, 3)
        this.vtbl.get_Key := CallbackCreate(GetMethod(implObj, "get_Key"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.IsPropertyReadOnly := CallbackCreate(GetMethod(implObj, "IsPropertyReadOnly"), flags, 3)
        this.vtbl.get_Valid := CallbackCreate(GetMethod(implObj, "get_Valid"), flags, 2)
        this.vtbl.IsPropertyWriteOnly := CallbackCreate(GetMethod(implObj, "IsPropertyWriteOnly"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Value)
        CallbackFree(this.vtbl.get_Key)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.IsPropertyReadOnly)
        CallbackFree(this.vtbl.get_Valid)
        CallbackFree(this.vtbl.IsPropertyWriteOnly)
    }
}
