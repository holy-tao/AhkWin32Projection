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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum", "Add", "Remove", "Clear", "AddRange", "CreateDataCollectorFromXml", "CreateDataCollector"]

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-get_count
     */
    get_Count(retVal) {
        result := ComCall(7, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @param {Pointer<IDataCollector>} collector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-get_item
     */
    get_Item(index, collector) {
        result := ComCall(8, this, "ptr", index, "ptr*", collector, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-get__newenum
     */
    get__NewEnum(retVal) {
        result := ComCall(9, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataCollector} collector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-add
     */
    Add(collector) {
        result := ComCall(10, this, "ptr", collector, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} collector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-remove
     */
    Remove(collector) {
        result := ComCall(11, this, "ptr", collector, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataCollectorCollection} collectors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-addrange
     */
    AddRange(collectors) {
        result := ComCall(13, this, "ptr", collectors, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrXml 
     * @param {Pointer<IValueMap>} pValidation 
     * @param {Pointer<IDataCollector>} pCollector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-createdatacollectorfromxml
     */
    CreateDataCollectorFromXml(bstrXml, pValidation, pCollector) {
        bstrXml := bstrXml is String ? BSTR.Alloc(bstrXml).Value : bstrXml

        result := ComCall(14, this, "ptr", bstrXml, "ptr*", pValidation, "ptr*", pCollector, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<IDataCollector>} Collector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-createdatacollector
     */
    CreateDataCollector(Type, Collector) {
        result := ComCall(15, this, "int", Type, "ptr*", Collector, "HRESULT")
        return result
    }
}
