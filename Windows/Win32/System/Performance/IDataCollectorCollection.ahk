#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDataCollector.ahk
#Include ..\Com\IUnknown.ahk
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
     * Retrieves the number of data collectors in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorcollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the requested data collector from the collection.
     * @remarks
     * 
     * This property is the object's default property.
     * 
     * 
     * @param {VARIANT} index 
     * @returns {IDataCollector} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorcollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, "ptr", index, "ptr*", &collector := 0, "HRESULT")
        return IDataCollector(collector)
    }

    /**
     * Retrieves an interface to the enumeration.
     * @remarks
     * 
     * C++ programmers use this property.
     * 
     * The items of the enumeration are variants whose type is VT_UNKNOWN. To query for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a> interface, use the <b>punkVal</b> member of the variant.
     * 
     * The enumeration is a snapshot of the collection at the time of the call.
     * 
     * 
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &retVal := 0, "HRESULT")
        return IUnknown(retVal)
    }

    /**
     * Adds a data collector to the collection.
     * @param {IDataCollector} collector An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a> interface of the data collector to add to this collection.
     * @returns {HRESULT} Returns S_OK if successful. The following table shows a possible error value.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PLA_E_DCS_SINGLETON_REQUIRED</b></dt>
     * <dt>0x80300102</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current configuration for the data collector set requires that it contain exactly one data collector.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorcollection-add
     */
    Add(collector) {
        result := ComCall(10, this, "ptr", collector, "HRESULT")
        return result
    }

    /**
     * Removes a data collector from the collection.
     * @param {VARIANT} collector The zero-based index of the data collector to remove from the collection. The variant type can be VT_I4, VT_UI4, or VT_DISPATCH.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorcollection-remove
     */
    Remove(collector) {
        result := ComCall(11, this, "ptr", collector, "HRESULT")
        return result
    }

    /**
     * Removes all data collectors from the collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorcollection-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Adds one or more data collectors to the collection.
     * @param {IDataCollectorCollection} collectors An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollectorcollection">IDataCollectorCollection</a> interface to a collection of one or more data collectors to add to this collection.
     * @returns {HRESULT} Returns S_OK if successful. The following table shows a possible error value.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PLA_E_DCS_SINGLETON_REQUIRED</b></dt>
     * <dt>0x80300102</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current configuration for the data collector set requires that it contain exactly one data collector.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorcollection-addrange
     */
    AddRange(collectors) {
        result := ComCall(13, this, "ptr", collectors, "HRESULT")
        return result
    }

    /**
     * Creates a data collector using the specified XML.
     * @param {BSTR} bstrXml A string that contains the XML of the data collector to create. For details on specifying the XML string, see the Remarks section of the data collector that you want to create.
     * @param {Pointer<IValueMap>} pValidation An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemap">IValueMap</a> interface that you use to retrieve the validation error of each property whose value is not valid. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_count">IValueMap::Count</a> property is zero if there were no errors.
     * @param {Pointer<IDataCollector>} pCollector An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a> interface of the newly created data collector. To get the actual data collector interface requested, call the <b>QueryInterface</b> method.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorcollection-createdatacollectorfromxml
     */
    CreateDataCollectorFromXml(bstrXml, pValidation, pCollector) {
        bstrXml := bstrXml is String ? BSTR.Alloc(bstrXml).Value : bstrXml

        result := ComCall(14, this, "ptr", bstrXml, "ptr*", pValidation, "ptr*", pCollector, "HRESULT")
        return result
    }

    /**
     * Creates a data collector of the specified type.
     * @param {Integer} Type The type of data collector to create. For possible data collector types, see the <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-datacollectortype">DataCollectorType</a> enumeration.
     * @returns {IDataCollector} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a> interface of the newly created data collector. To get the actual data collector interface requested, call the <b>QueryInterface</b> method.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorcollection-createdatacollector
     */
    CreateDataCollector(Type) {
        result := ComCall(15, this, "int", Type, "ptr*", &Collector := 0, "HRESULT")
        return IDataCollector(Collector)
    }
}
