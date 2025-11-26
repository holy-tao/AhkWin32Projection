#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDataCollectorSet.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages a collection of DataCollectorSet objects.To get this interface, call the CoCreateInstance function, passing __uuidof(DataCollectorSetCollection) as the class identifier and __uuidof(IDataCollectorSetCollection) as the interface identifier.Then, to populate the collection, call the IDataCollectorSetCollection::GetDataCollectorSets method.
 * @remarks
 * 
 * To create the object from a script, use the Pla.DataCollectorSetCollection program identifier.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-idatacollectorsetcollection
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class IDataCollectorSetCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataCollectorSetCollection
     * @type {Guid}
     */
    static IID => Guid("{03837524-098b-11d8-9414-505054503030}")

    /**
     * The class identifier for DataCollectorSetCollection
     * @type {Guid}
     */
    static CLSID => Guid("{03837525-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum", "Add", "Remove", "Clear", "AddRange", "GetDataCollectorSets"]

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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorsetcollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {IDataCollectorSet} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorsetcollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, "ptr", index, "ptr*", &set := 0, "HRESULT")
        return IDataCollectorSet(set)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorsetcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &retVal := 0, "HRESULT")
        return IUnknown(retVal)
    }

    /**
     * 
     * @param {IDataCollectorSet} set 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorsetcollection-add
     */
    Add(set) {
        result := ComCall(10, this, "ptr", set, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} set 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorsetcollection-remove
     */
    Remove(set) {
        result := ComCall(11, this, "ptr", set, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorsetcollection-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataCollectorSetCollection} sets 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorsetcollection-addrange
     */
    AddRange(sets) {
        result := ComCall(13, this, "ptr", sets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} server 
     * @param {BSTR} filter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorsetcollection-getdatacollectorsets
     */
    GetDataCollectorSets(server, filter) {
        server := server is String ? BSTR.Alloc(server).Value : server
        filter := filter is String ? BSTR.Alloc(filter).Value : filter

        result := ComCall(14, this, "ptr", server, "ptr", filter, "HRESULT")
        return result
    }
}
