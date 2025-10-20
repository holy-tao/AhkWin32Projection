#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages a collection of DataCollector objects.To get this interface, access the IDataCollectorSet::DataCollectors property.
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-idatacollectorcollection
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class IDataCollectorCollection extends IDispatch{
    /**
     * The interface identifier for IDataCollectorCollection
     * @type {Guid}
     */
    static IID => Guid("{03837502-098b-11d8-9414-505054503030}")

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
     * @param {Pointer<IDataCollector>} collector 
     * @returns {HRESULT} 
     */
    get_Item(index, collector) {
        result := ComCall(8, this, "ptr", index, "ptr", collector, "int")
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
     * @param {Pointer<IDataCollector>} collector 
     * @returns {HRESULT} 
     */
    Add(collector) {
        result := ComCall(10, this, "ptr", collector, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} collector 
     * @returns {HRESULT} 
     */
    Remove(collector) {
        result := ComCall(11, this, "ptr", collector, "int")
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
     * @param {Pointer<IDataCollectorCollection>} collectors 
     * @returns {HRESULT} 
     */
    AddRange(collectors) {
        result := ComCall(13, this, "ptr", collectors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrXml 
     * @param {Pointer<IValueMap>} pValidation 
     * @param {Pointer<IDataCollector>} pCollector 
     * @returns {HRESULT} 
     */
    CreateDataCollectorFromXml(bstrXml, pValidation, pCollector) {
        bstrXml := bstrXml is String ? BSTR.Alloc(bstrXml).Value : bstrXml

        result := ComCall(14, this, "ptr", bstrXml, "ptr", pValidation, "ptr", pCollector, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<IDataCollector>} Collector 
     * @returns {HRESULT} 
     */
    CreateDataCollector(Type, Collector) {
        result := ComCall(15, this, "int", Type, "ptr", Collector, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
