#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ValueMapType.ahk" { ValueMapType }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Defines a name/value pair.To get this interface, call the IValueMap::Item property. To create this interface, call the IValueMap::CreateValueMapItem method.
 * @see https://learn.microsoft.com/windows/win32/api/pla/nn-pla-ivaluemapitem
 * @namespace Windows.Win32.System.Performance
 */
export default struct IValueMapItem extends IDispatch {
    /**
     * The interface identifier for IValueMapItem
     * @type {Guid}
     */
    static IID := Guid("{03837533-098b-11d8-9414-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IValueMapItem interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Description  : IntPtr
        put_Description  : IntPtr
        get_Enabled      : IntPtr
        put_Enabled      : IntPtr
        get_Key          : IntPtr
        put_Key          : IntPtr
        get_Value        : IntPtr
        put_Value        : IntPtr
        get_ValueMapType : IntPtr
        put_ValueMapType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IValueMapItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {BSTR} 
     */
    Key {
        get => this.get_Key()
        set => this.put_Key(value)
    }

    /**
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * @type {ValueMapType} 
     */
    ValueMapType {
        get => this.get_ValueMapType()
        set => this.put_ValueMapType(value)
    }

    /**
     * Retrieves or sets a description of the item. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-get_description
     */
    get_Description() {
        description := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, description, "HRESULT")
        return description
    }

    /**
     * Retrieves or sets a description of the item. (Put)
     * @param {BSTR} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-put_description
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(8, this, BSTR, description, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that indicates whether the item is enabled. (Get)
     * @remarks
     * The type of the item determines whether more than one item in the value map collection can be enabled. For example, one of the possible settings is to enable one or more keywords while enabling only one level.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-get_enabled
     */
    get_Enabled() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Retrieves or sets a value that indicates whether the item is enabled. (Put)
     * @remarks
     * The type of the item determines whether more than one item in the value map collection can be enabled. For example, one of the possible settings is to enable one or more keywords while enabling only one level.
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(10, this, VARIANT_BOOL, enabled, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the name of the item. (Get)
     * @remarks
     * Note that if you set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a> property and PLA generates the items, the items are not named.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-get_key
     */
    get_Key() {
        key := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, key, "HRESULT")
        return key
    }

    /**
     * Retrieves or sets the name of the item. (Put)
     * @remarks
     * Note that if you set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a> property and PLA generates the items, the items are not named.
     * @param {BSTR} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-put_key
     */
    put_Key(key) {
        key := key is String ? BSTR.Alloc(key).Value : key

        result := ComCall(12, this, BSTR, key, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the value of the item. (Get)
     * @remarks
     * The variant type is VT_UI8 if the <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype">ValueMapType</a> enumeration is plaIndex, plaFlag or plaFlagArray.
     * 
     * The variant type is VT_UI4 if <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype">ValueMapType</a> is plaValidation.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-get_value
     */
    get_Value() {
        Value := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, Value, "HRESULT")
        return Value
    }

    /**
     * Retrieves or sets the value of the item. (Put)
     * @remarks
     * The variant type is VT_UI8 if the <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype">ValueMapType</a> enumeration is plaIndex, plaFlag or plaFlagArray.
     * 
     * The variant type is VT_UI4 if <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype">ValueMapType</a> is plaValidation.
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-put_value
     */
    put_Value(Value) {
        result := ComCall(14, this, VARIANT, Value, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the type of the item. (Get)
     * @returns {ValueMapType} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-get_valuemaptype
     */
    get_ValueMapType() {
        result := ComCall(15, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * Retrieves or sets the type of the item. (Put)
     * @param {ValueMapType} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-put_valuemaptype
     */
    put_ValueMapType(type) {
        result := ComCall(16, this, ValueMapType, type, "HRESULT")
        return result
    }

    Query(iid) {
        if (IValueMapItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
        this.vtbl.put_Enabled := CallbackCreate(GetMethod(implObj, "put_Enabled"), flags, 2)
        this.vtbl.get_Key := CallbackCreate(GetMethod(implObj, "get_Key"), flags, 2)
        this.vtbl.put_Key := CallbackCreate(GetMethod(implObj, "put_Key"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.put_Value := CallbackCreate(GetMethod(implObj, "put_Value"), flags, 2)
        this.vtbl.get_ValueMapType := CallbackCreate(GetMethod(implObj, "get_ValueMapType"), flags, 2)
        this.vtbl.put_ValueMapType := CallbackCreate(GetMethod(implObj, "put_ValueMapType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_Enabled)
        CallbackFree(this.vtbl.put_Enabled)
        CallbackFree(this.vtbl.get_Key)
        CallbackFree(this.vtbl.put_Key)
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Value)
        CallbackFree(this.vtbl.get_ValueMapType)
        CallbackFree(this.vtbl.put_ValueMapType)
    }
}
