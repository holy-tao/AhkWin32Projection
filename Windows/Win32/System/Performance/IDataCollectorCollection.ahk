#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IValueMap.ahk" { IValueMap }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DataCollectorType.ahk" { DataCollectorType }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDataCollector.ahk" { IDataCollector }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Manages a collection of DataCollector objects.To get this interface, access the IDataCollectorSet::DataCollectors property.
 * @see https://learn.microsoft.com/windows/win32/api/pla/nn-pla-idatacollectorcollection
 * @namespace Windows.Win32.System.Performance
 */
export default struct IDataCollectorCollection extends IDispatch {
    /**
     * The interface identifier for IDataCollectorCollection
     * @type {Guid}
     */
    static IID := Guid("{03837502-098b-11d8-9414-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataCollectorCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count                  : IntPtr
        get_Item                   : IntPtr
        get__NewEnum               : IntPtr
        Add                        : IntPtr
        Remove                     : IntPtr
        Clear                      : IntPtr
        AddRange                   : IntPtr
        CreateDataCollectorFromXml : IntPtr
        CreateDataCollector        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataCollectorCollection.Vtbl()
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
     * Retrieves the number of data collectors in the collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the requested data collector from the collection.
     * @remarks
     * This property is the object's default property.
     * @param {VARIANT} index 
     * @returns {IDataCollector} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, VARIANT, index, "ptr*", &collector := 0, "HRESULT")
        return IDataCollector(collector)
    }

    /**
     * Retrieves an interface to the enumeration. (IDataCollectorCollection.get__NewEnum)
     * @remarks
     * C++ programmers use this property.
     * 
     * The items of the enumeration are variants whose type is VT_UNKNOWN. To query for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a> interface, use the <b>punkVal</b> member of the variant.
     * 
     * The enumeration is a snapshot of the collection at the time of the call.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-get__newenum
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
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-add
     */
    Add(collector) {
        result := ComCall(10, this, "ptr", collector, "HRESULT")
        return result
    }

    /**
     * Removes a data collector from the collection.
     * @remarks
     * If the variant type is VT_DISPATCH, pass the <b>IDispatch</b> interface of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a> to be removed.
     * 
     * Note that by removing the collector from the collection, you are also removing the collector from the data collector set.
     * @param {VARIANT} collector The zero-based index of the data collector to remove from the collection. The variant type can be VT_I4, VT_UI4, or VT_DISPATCH.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-remove
     */
    Remove(collector) {
        result := ComCall(11, this, VARIANT, collector, "HRESULT")
        return result
    }

    /**
     * Removes all data collectors from the collection.
     * @remarks
     * Note that by removing the collectors from the collection, you are also removing the collectors from the data collector set.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-clear
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
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-addrange
     */
    AddRange(collectors) {
        result := ComCall(13, this, "ptr", collectors, "HRESULT")
        return result
    }

    /**
     * Creates a data collector using the specified XML.
     * @remarks
     * If the XML syntax is valid, this API will return S_OK, even if one or more properties is not valid.  Those properties whose values are valid are set. Those properties whose values are not valid are set to their default value.
     * 
     * To determine the errors that occurred, retrieve the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemapitem">IValueMapItem</a> interface for each error. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_key">IValueMapItem::Key</a> property contains the XPath of the element in error, for example, /AlertDataCollector/TaskArguments. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_value">IValueMapItem::Value</a> property contains the HRESULT associated with the error, and the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_description">IValueMapItem::Description</a> property contains the message text associated with the error.
     * 
     * Typically, any errors that occur will be one of the following HRESULT values.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>PLA_S_PROPERTY_IGNORED</td>
     * <td>PLA ignored the property element because the data collector does not contain the specified property.</td>
     * </tr>
     * <tr>
     * <td>PLA_E_PROPERTY_CONFLICT</td>
     * <td>The property conflicts with another property, for example, both <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logappend">LogAppend</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logcircular">LogCircular</a> are VARIANT_TRUE.</td>
     * </tr>
     * </table>
     *  
     * 
     * Use one of the following interface identifiers to query the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a> interface for the specific data collector.
     * 
     * <table>
     * <tr>
     * <th>Data collector interface</th>
     * <th>Interface identifier</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-iapitracingdatacollector">IApiTracingDataCollector</a>
     * </td>
     * <td>IID_IApiTracingDataCollector</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ialertdatacollector">IAlertDataCollector</a>
     * </td>
     * <td>IID_IAlertDataCollector</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-iconfigurationdatacollector">IConfigurationDataCollector</a>
     * </td>
     * <td>IID_IConfigurationDataCollector</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-iperformancecounterdatacollector">IPerformanceCounterDataCollector</a>
     * </td>
     * <td>IID_IPerformanceCounterDataCollector</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-itracedatacollector">ITraceDataCollector</a>
     * </td>
     * <td>IID_ITraceDataCollector</td>
     * </tr>
     * </table>
     * @param {BSTR} bstrXml A string that contains the XML of the data collector to create. For details on specifying the XML string, see the Remarks section of the data collector that you want to create.
     * @param {Pointer<IValueMap>} pValidation An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemap">IValueMap</a> interface that you use to retrieve the validation error of each property whose value is not valid. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_count">IValueMap::Count</a> property is zero if there were no errors.
     * @param {Pointer<IDataCollector>} pCollector An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a> interface of the newly created data collector. To get the actual data collector interface requested, call the <b>QueryInterface</b> method.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-createdatacollectorfromxml
     */
    CreateDataCollectorFromXml(bstrXml, pValidation, pCollector) {
        bstrXml := bstrXml is String ? BSTR.Alloc(bstrXml).Value : bstrXml

        result := ComCall(14, this, BSTR, bstrXml, IValueMap.Ptr, pValidation, IDataCollector.Ptr, pCollector, "HRESULT")
        return result
    }

    /**
     * Creates a data collector of the specified type.
     * @remarks
     * Use one of the following interface identifiers to query the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a> interface for the specific data collector.
     * 
     * <table>
     * <tr>
     * <th>Data collector interface</th>
     * <th>Interface identifier</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-iapitracingdatacollector">IApiTracingDataCollector</a>
     * </td>
     * <td>IID_IApiTracingDataCollector</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ialertdatacollector">IAlertDataCollector</a>
     * </td>
     * <td>IID_IAlertDataCollector</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-iconfigurationdatacollector">IConfigurationDataCollector</a>
     * </td>
     * <td>IID_IConfigurationDataCollector</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-iperformancecounterdatacollector">IPerformanceCounterDataCollector</a>
     * </td>
     * <td>IID_IPerformanceCounterDataCollector</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-itracedatacollector">ITraceDataCollector</a>
     * </td>
     * <td>IID_ITraceDataCollector</td>
     * </tr>
     * </table>
     * @param {DataCollectorType} Type The type of data collector to create. For possible data collector types, see the <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-datacollectortype">DataCollectorType</a> enumeration.
     * @returns {IDataCollector} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a> interface of the newly created data collector. To get the actual data collector interface requested, call the <b>QueryInterface</b> method.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorcollection-createdatacollector
     */
    CreateDataCollector(Type) {
        result := ComCall(15, this, DataCollectorType, Type, "ptr*", &Collector := 0, "HRESULT")
        return IDataCollector(Collector)
    }

    Query(iid) {
        if (IDataCollectorCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
        this.vtbl.AddRange := CallbackCreate(GetMethod(implObj, "AddRange"), flags, 2)
        this.vtbl.CreateDataCollectorFromXml := CallbackCreate(GetMethod(implObj, "CreateDataCollectorFromXml"), flags, 4)
        this.vtbl.CreateDataCollector := CallbackCreate(GetMethod(implObj, "CreateDataCollector"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.AddRange)
        CallbackFree(this.vtbl.CreateDataCollectorFromXml)
        CallbackFree(this.vtbl.CreateDataCollector)
    }
}
