#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_Count(retVal) {
        result := ComCall(7, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @param {Pointer<IDataCollectorSet>} set 
     * @returns {HRESULT} 
     */
    get_Item(index, set) {
        result := ComCall(8, this, "ptr", index, "ptr", set, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retVal 
     * @returns {HRESULT} 
     */
    get__NewEnum(retVal) {
        result := ComCall(9, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataCollectorSet>} set 
     * @returns {HRESULT} 
     */
    Add(set) {
        result := ComCall(10, this, "ptr", set, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} set 
     * @returns {HRESULT} 
     */
    Remove(set) {
        result := ComCall(11, this, "ptr", set, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataCollectorSetCollection>} sets 
     * @returns {HRESULT} 
     */
    AddRange(sets) {
        result := ComCall(13, this, "ptr", sets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} server 
     * @param {BSTR} filter 
     * @returns {HRESULT} 
     */
    GetDataCollectorSets(server, filter) {
        server := server is String ? BSTR.Alloc(server).Value : server
        filter := filter is String ? BSTR.Alloc(filter).Value : filter

        result := ComCall(14, this, "ptr", server, "ptr", filter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
