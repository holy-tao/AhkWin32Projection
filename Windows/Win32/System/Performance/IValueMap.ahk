#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IValueMapItem.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages a collection of name/value pairs.To get this interface, access one of the following properties or methods:IDataCollector::SetXmlIDataCollectorSet::CommitIDataCollectorSet::SetXmlITraceDataProvider::KeywordsAllITraceDataProvider::KeywordsAnyITraceDataProvider::LevelITraceDataProvider::Properties
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-ivaluemap
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class IValueMap extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IValueMap
     * @type {Guid}
     */
    static IID => Guid("{03837534-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum", "get_Description", "put_Description", "get_Value", "put_Value", "get_ValueMapType", "put_ValueMapType", "Add", "Remove", "Clear", "AddRange", "CreateValueMapItem"]

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
     * @type {Integer} 
     */
    ValueMapType {
        get => this.get_ValueMapType()
        set => this.put_ValueMapType(value)
    }

    /**
     * Retrieves the number of items in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemap-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the requested item from the collection.
     * @remarks
     * 
     * This property is the object's default property.
     * 
     * 
     * @param {VARIANT} index 
     * @returns {IValueMapItem} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemap-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, "ptr", index, "ptr*", &value := 0, "HRESULT")
        return IValueMapItem(value)
    }

    /**
     * Retrieves an interface to the enumeration.
     * @remarks
     * 
     *  C++ programmers use this property.
     * 
     * The enumeration is a snapshot of the collection at the time of the call.
     * 
     * The items of the enumeration are variants whose type is VT_UNKNOWN. To query for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemapitem">IValueMapItem</a> interface, use the <b>punkVal</b> member of the variant.
     * 
     * 
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemap-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &retVal := 0, "HRESULT")
        return IUnknown(retVal)
    }

    /**
     * Retrieves or sets a description of the collection.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemap-get_description
     */
    get_Description() {
        description := BSTR()
        result := ComCall(10, this, "ptr", description, "HRESULT")
        return description
    }

    /**
     * Retrieves or sets a description of the collection.
     * @param {BSTR} description 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemap-put_description
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(11, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the value of the collection.
     * @remarks
     * 
     * Depending on the value of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_valuemaptype">IValueMap::ValueMapType</a> property, this value is either one of the values in the collection or the value derived by combining all the item values in the collection with the <b>OR</b> operator.
     * 
     * The variant type is VT_UI8 if the <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype">ValueMapType</a> enumeration is <b>plaIndex</b>, <b>plaFlag</b> or <b>plaFlagArray</b>.
     * 
     * The variant type is VT_UI4 if the <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype">ValueMapType</a> enumeration is <b>plaValidation</b>.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemap-get_value
     */
    get_Value() {
        Value := VARIANT()
        result := ComCall(12, this, "ptr", Value, "HRESULT")
        return Value
    }

    /**
     * Retrieves or sets the value of the collection.
     * @remarks
     * 
     * Depending on the value of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_valuemaptype">IValueMap::ValueMapType</a> property, this value is either one of the values in the collection or the value derived by combining all the item values in the collection with the <b>OR</b> operator.
     * 
     * The variant type is VT_UI8 if the <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype">ValueMapType</a> enumeration is <b>plaIndex</b>, <b>plaFlag</b> or <b>plaFlagArray</b>.
     * 
     * The variant type is VT_UI4 if the <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype">ValueMapType</a> enumeration is <b>plaValidation</b>.
     * 
     * 
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemap-put_value
     */
    put_Value(Value) {
        result := ComCall(13, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the type of items in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemap-get_valuemaptype
     */
    get_ValueMapType() {
        result := ComCall(14, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * Retrieves or sets the type of items in the collection.
     * @param {Integer} type 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemap-put_valuemaptype
     */
    put_ValueMapType(type) {
        result := ComCall(15, this, "int", type, "HRESULT")
        return result
    }

    /**
     * Adds an item to the collection.
     * @param {VARIANT} value An <b>IDispatch</b> interface of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemapitem">IValueMapItem</a> interface to add to the collection. The variant type is VT_DISPATCH. 
     * 
     * You can also add a string or integer value. If the value is an integer (the variant type is VT_I4, VT_UI4, VT_I8, or VT_UI8), PLA adds an item with the specified value. 
     * 
     * If the value is a string  (the variant type is VT_BSTR), PLA tries to convert the string to an integer. If successful, PLA adds an item with the specified integer value. If PLA cannot convert the string, PLA searches the collection for a key that matches the string. If found, PLA enables the item; otherwise, the add fails.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemap-add
     */
    Add(value) {
        result := ComCall(16, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Removes an item from the collection.
     * @param {VARIANT} value The zero-based index of the item to remove from the collection. The variant type can be VT_I4, VT_UI4, or VT_DISPATCH.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemap-remove
     */
    Remove(value) {
        result := ComCall(17, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Removes all items from the collection
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemap-clear
     */
    Clear() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Adds one or more items to the collection.
     * @param {IValueMap} map An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemap">IValueMap</a> interface that contains a collection of items to add to this collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemap-addrange
     */
    AddRange(map) {
        result := ComCall(19, this, "ptr", map, "HRESULT")
        return result
    }

    /**
     * Creates a value map item.
     * @returns {IValueMapItem} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemapitem">IValueMapItem</a> interface that you use to define a name/value pair.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemap-createvaluemapitem
     */
    CreateValueMapItem() {
        result := ComCall(20, this, "ptr*", &Item := 0, "HRESULT")
        return IValueMapItem(Item)
    }
}
