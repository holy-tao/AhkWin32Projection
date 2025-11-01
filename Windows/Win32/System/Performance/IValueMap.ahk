#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get_count
     */
    get_Count(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @param {Pointer<IValueMapItem>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get_item
     */
    get_Item(index, value) {
        result := ComCall(8, this, "ptr", index, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get__newenum
     */
    get__NewEnum(retVal) {
        result := ComCall(9, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get_description
     */
    get_Description(description) {
        result := ComCall(10, this, "ptr", description, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get_value
     */
    get_Value(Value) {
        result := ComCall(12, this, "ptr", Value, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-get_valuemaptype
     */
    get_ValueMapType(type) {
        typeMarshal := type is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, typeMarshal, type, "HRESULT")
        return result
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
     * @param {Pointer<IValueMapItem>} Item 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemap-createvaluemapitem
     */
    CreateValueMapItem(Item) {
        result := ComCall(20, this, "ptr*", Item, "HRESULT")
        return result
    }
}
