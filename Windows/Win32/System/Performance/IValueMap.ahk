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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {IValueMapItem} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, "ptr", index, "ptr*", &value := 0, "HRESULT")
        return IValueMapItem(value)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &retVal := 0, "HRESULT")
        return IUnknown(retVal)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get_description
     */
    get_Description() {
        description := BSTR()
        result := ComCall(10, this, "ptr", description, "HRESULT")
        return description
    }

    /**
     * 
     * @param {BSTR} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-put_description
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(11, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get_value
     */
    get_Value() {
        Value := VARIANT()
        result := ComCall(12, this, "ptr", Value, "HRESULT")
        return Value
    }

    /**
     * 
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-put_value
     */
    put_Value(Value) {
        result := ComCall(13, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get_valuemaptype
     */
    get_ValueMapType() {
        result := ComCall(14, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-put_valuemaptype
     */
    put_ValueMapType(type) {
        result := ComCall(15, this, "int", type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-add
     */
    Add(value) {
        result := ComCall(16, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-remove
     */
    Remove(value) {
        result := ComCall(17, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-clear
     */
    Clear() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IValueMap} map 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-addrange
     */
    AddRange(map) {
        result := ComCall(19, this, "ptr", map, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IValueMapItem} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-createvaluemapitem
     */
    CreateValueMapItem() {
        result := ComCall(20, this, "ptr*", &Item := 0, "HRESULT")
        return IValueMapItem(Item)
    }
}
