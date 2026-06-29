#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IValueMapItem.ahk" { IValueMapItem }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ValueMapType.ahk" { ValueMapType }

/**
 * Manages a collection of name/value pairs.To get this interface, access one of the following properties or methods:IDataCollector::SetXmlIDataCollectorSet::CommitIDataCollectorSet::SetXmlITraceDataProvider::KeywordsAllITraceDataProvider::KeywordsAnyITraceDataProvider::LevelITraceDataProvider::Properties
 * @see https://learn.microsoft.com/windows/win32/api/pla/nn-pla-ivaluemap
 * @namespace Windows.Win32.System.Performance
 */
export default struct IValueMap extends IDispatch {
    /**
     * The interface identifier for IValueMap
     * @type {Guid}
     */
    static IID := Guid("{03837534-098b-11d8-9414-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IValueMap interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count          : IntPtr
        get_Item           : IntPtr
        get__NewEnum       : IntPtr
        get_Description    : IntPtr
        put_Description    : IntPtr
        get_Value          : IntPtr
        put_Value          : IntPtr
        get_ValueMapType   : IntPtr
        put_ValueMapType   : IntPtr
        Add                : IntPtr
        Remove             : IntPtr
        Clear              : IntPtr
        AddRange           : IntPtr
        CreateValueMapItem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IValueMap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
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
     * Retrieves the number of items in the collection. (IValueMap.get_Count)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the requested item from the collection. (IValueMap.get_Item)
     * @remarks
     * This property is the object's default property.
     * @param {VARIANT} index 
     * @returns {IValueMapItem} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, VARIANT, index, "ptr*", &value := 0, "HRESULT")
        return IValueMapItem(value)
    }

    /**
     * Retrieves an interface to the enumeration. (IValueMap.get__NewEnum)
     * @remarks
     * C++ programmers use this property.
     * 
     * The enumeration is a snapshot of the collection at the time of the call.
     * 
     * The items of the enumeration are variants whose type is VT_UNKNOWN. To query for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemapitem">IValueMapItem</a> interface, use the <b>punkVal</b> member of the variant.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &retVal := 0, "HRESULT")
        return IUnknown(retVal)
    }

    /**
     * Retrieves or sets a description of the collection. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get_description
     */
    get_Description() {
        description := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, description, "HRESULT")
        return description
    }

    /**
     * Retrieves or sets a description of the collection. (Put)
     * @param {BSTR} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-put_description
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(11, this, BSTR, description, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the value of the collection. (Get)
     * @remarks
     * Depending on the value of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_valuemaptype">IValueMap::ValueMapType</a> property, this value is either one of the values in the collection or the value derived by combining all the item values in the collection with the <b>OR</b> operator.
     * 
     * The variant type is VT_UI8 if the <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype">ValueMapType</a> enumeration is <b>plaIndex</b>, <b>plaFlag</b> or <b>plaFlagArray</b>.
     * 
     * The variant type is VT_UI4 if the <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype">ValueMapType</a> enumeration is <b>plaValidation</b>.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get_value
     */
    get_Value() {
        Value := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, Value, "HRESULT")
        return Value
    }

    /**
     * Retrieves or sets the value of the collection. (Put)
     * @remarks
     * Depending on the value of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_valuemaptype">IValueMap::ValueMapType</a> property, this value is either one of the values in the collection or the value derived by combining all the item values in the collection with the <b>OR</b> operator.
     * 
     * The variant type is VT_UI8 if the <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype">ValueMapType</a> enumeration is <b>plaIndex</b>, <b>plaFlag</b> or <b>plaFlagArray</b>.
     * 
     * The variant type is VT_UI4 if the <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype">ValueMapType</a> enumeration is <b>plaValidation</b>.
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-put_value
     */
    put_Value(Value) {
        result := ComCall(13, this, VARIANT, Value, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the type of items in the collection. (Get)
     * @returns {ValueMapType} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get_valuemaptype
     */
    get_ValueMapType() {
        result := ComCall(14, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * Retrieves or sets the type of items in the collection. (Put)
     * @param {ValueMapType} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-put_valuemaptype
     */
    put_ValueMapType(type) {
        result := ComCall(15, this, ValueMapType, type, "HRESULT")
        return result
    }

    /**
     * Adds an item to the collection. (IValueMap.Add)
     * @param {VARIANT} value An <b>IDispatch</b> interface of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemapitem">IValueMapItem</a> interface to add to the collection. The variant type is VT_DISPATCH. 
     * 
     * You can also add a string or integer value. If the value is an integer (the variant type is VT_I4, VT_UI4, VT_I8, or VT_UI8), PLA adds an item with the specified value. 
     * 
     * If the value is a string  (the variant type is VT_BSTR), PLA tries to convert the string to an integer. If successful, PLA adds an item with the specified integer value. If PLA cannot convert the string, PLA searches the collection for a key that matches the string. If found, PLA enables the item; otherwise, the add fails.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-add
     */
    Add(value) {
        result := ComCall(16, this, VARIANT, value, "HRESULT")
        return result
    }

    /**
     * Removes an item from the collection.
     * @remarks
     * If the variant type is VT_DISPATCH, pass the <b>IDispatch</b> interface of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemapitem">IValueMapItem</a> interface to be removed.
     * @param {VARIANT} value The zero-based index of the item to remove from the collection. The variant type can be VT_I4, VT_UI4, or VT_DISPATCH.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-remove
     */
    Remove(value) {
        result := ComCall(17, this, VARIANT, value, "HRESULT")
        return result
    }

    /**
     * Removes all items from the collection
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-clear
     */
    Clear() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Adds one or more items to the collection.
     * @param {IValueMap} _map An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemap">IValueMap</a> interface that contains a collection of items to add to this collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-addrange
     */
    AddRange(_map) {
        result := ComCall(19, this, "ptr", _map, "HRESULT")
        return result
    }

    /**
     * Creates a value map item.
     * @returns {IValueMapItem} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemapitem">IValueMapItem</a> interface that you use to define a name/value pair.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-createvaluemapitem
     */
    CreateValueMapItem() {
        result := ComCall(20, this, "ptr*", &Item := 0, "HRESULT")
        return IValueMapItem(Item)
    }

    Query(iid) {
        if (IValueMap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.put_Value := CallbackCreate(GetMethod(implObj, "put_Value"), flags, 2)
        this.vtbl.get_ValueMapType := CallbackCreate(GetMethod(implObj, "get_ValueMapType"), flags, 2)
        this.vtbl.put_ValueMapType := CallbackCreate(GetMethod(implObj, "put_ValueMapType"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
        this.vtbl.AddRange := CallbackCreate(GetMethod(implObj, "AddRange"), flags, 2)
        this.vtbl.CreateValueMapItem := CallbackCreate(GetMethod(implObj, "CreateValueMapItem"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Value)
        CallbackFree(this.vtbl.get_ValueMapType)
        CallbackFree(this.vtbl.put_ValueMapType)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.AddRange)
        CallbackFree(this.vtbl.CreateValueMapItem)
    }
}
