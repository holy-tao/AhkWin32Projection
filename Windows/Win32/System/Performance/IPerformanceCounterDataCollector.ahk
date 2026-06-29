#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FileFormat.ahk" { FileFormat }
#Import ".\IDataCollector.ahk" { IDataCollector }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Specifies the performance counters to query and the log file to which the counter data is written.To create this data collector, call the IDataCollectorCollection::CreateDataCollector or IDataCollectorCollection::CreateDataCollectorFromXml method.
 * @remarks
 * The following example shows the XML that you can use to initialize this object if you call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorcollection-createdatacollectorfromxml">CreateDataCollectorFromXml</a> to create it. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_xml">IDataCollector::Xml</a> property also returns this XML.
 * 
 * 
 * ```xml
 * <PerformanceCounterDataCollector>
 *     <DataSourceName/>
 *     <Counter/>             <!-- Specify this element for each counter -->
 *     <CounterDisplayName/>  <!-- Read-only. Contains the contents of -->
 *                            <!-- <PerformanceCounter/> in the user's locale -->
 *     <LogFileFormat/>
 *     <SampleInterval/>
 *     <SegmentMaxRecords/>
 * </PerformanceCounterDataCollector>
 * ```
 * 
 * 
 * Note that the example does not show the property elements inherited from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a> that you also need to specify.
 * 
 * When you specify the XML to create the collector, you can specify only the elements for the properties that you want to set. If you do not specify a property, PLA provides a default value. When you retrieve the XML for the collector, the XML provides all elements, including those from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a>.
 * @see https://learn.microsoft.com/windows/win32/api/pla/nn-pla-iperformancecounterdatacollector
 * @namespace Windows.Win32.System.Performance
 */
export default struct IPerformanceCounterDataCollector extends IDataCollector {
    /**
     * The interface identifier for IPerformanceCounterDataCollector
     * @type {Guid}
     */
    static IID := Guid("{03837506-098b-11d8-9414-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPerformanceCounterDataCollector interfaces
    */
    struct Vtbl extends IDataCollector.Vtbl {
        get_DataSourceName      : IntPtr
        put_DataSourceName      : IntPtr
        get_PerformanceCounters : IntPtr
        put_PerformanceCounters : IntPtr
        get_LogFileFormat       : IntPtr
        put_LogFileFormat       : IntPtr
        get_SampleInterval      : IntPtr
        put_SampleInterval      : IntPtr
        get_SegmentMaxRecords   : IntPtr
        put_SegmentMaxRecords   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPerformanceCounterDataCollector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    DataSourceName {
        get => this.get_DataSourceName()
        set => this.put_DataSourceName(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    PerformanceCounters {
        get => this.get_PerformanceCounters()
        set => this.put_PerformanceCounters(value)
    }

    /**
     * @type {FileFormat} 
     */
    LogFileFormat {
        get => this.get_LogFileFormat()
        set => this.put_LogFileFormat(value)
    }

    /**
     * @type {Integer} 
     */
    SampleInterval {
        get => this.get_SampleInterval()
        set => this.put_SampleInterval(value)
    }

    /**
     * @type {Integer} 
     */
    SegmentMaxRecords {
        get => this.get_SegmentMaxRecords()
        set => this.put_SegmentMaxRecords(value)
    }

    /**
     * Retrieves or sets the data source name if the log file is an SQL log file. (Get)
     * @remarks
     * Specify the data source name only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-iperformancecounterdatacollector-get_logfileformat">IPerformanceCounterDataCollector::LogFileFormat</a> property is <b>plaSql</b>.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-get_datasourcename
     */
    get_DataSourceName() {
        dsn := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, dsn, "HRESULT")
        return dsn
    }

    /**
     * Retrieves or sets the data source name if the log file is an SQL log file. (Put)
     * @remarks
     * Specify the data source name only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-iperformancecounterdatacollector-get_logfileformat">IPerformanceCounterDataCollector::LogFileFormat</a> property is <b>plaSql</b>.
     * @param {BSTR} dsn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-put_datasourcename
     */
    put_DataSourceName(dsn) {
        dsn := dsn is String ? BSTR.Alloc(dsn).Value : dsn

        result := ComCall(33, this, BSTR, dsn, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the performance counters to query. (Get)
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-get_performancecounters
     */
    get_PerformanceCounters() {
        result := ComCall(34, this, "ptr*", &_counters := 0, "HRESULT")
        return _counters
    }

    /**
     * Retrieves or sets the performance counters to query. (Put)
     * @param {Pointer<SAFEARRAY>} _counters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-put_performancecounters
     */
    put_PerformanceCounters(_counters) {
        result := ComCall(35, this, SAFEARRAY.Ptr, _counters, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the format of the log file. (Get)
     * @returns {FileFormat} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-get_logfileformat
     */
    get_LogFileFormat() {
        result := ComCall(36, this, "int*", &format := 0, "HRESULT")
        return format
    }

    /**
     * Retrieves or sets the format of the log file. (Put)
     * @param {FileFormat} format 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-put_logfileformat
     */
    put_LogFileFormat(format) {
        result := ComCall(37, this, FileFormat, format, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the interval to wait between sampling counter data. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-get_sampleinterval
     */
    get_SampleInterval() {
        result := ComCall(38, this, "uint*", &_interval := 0, "HRESULT")
        return _interval
    }

    /**
     * Retrieves or sets the interval to wait between sampling counter data. (Put)
     * @param {Integer} _interval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-put_sampleinterval
     */
    put_SampleInterval(_interval) {
        result := ComCall(39, this, "uint", _interval, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the maximum number of samples to log. (Get)
     * @remarks
     * When the maximum number of samples is reached, PLA switches to a new log file and continues logging if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segment">IDataCollectorSet::Segment</a> property is VARIANT_TRUE; otherwise, PLA stops logging.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-get_segmentmaxrecords
     */
    get_SegmentMaxRecords() {
        result := ComCall(40, this, "uint*", &records := 0, "HRESULT")
        return records
    }

    /**
     * Retrieves or sets the maximum number of samples to log. (Put)
     * @remarks
     * When the maximum number of samples is reached, PLA switches to a new log file and continues logging if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segment">IDataCollectorSet::Segment</a> property is VARIANT_TRUE; otherwise, PLA stops logging.
     * @param {Integer} records 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-put_segmentmaxrecords
     */
    put_SegmentMaxRecords(records) {
        result := ComCall(41, this, "uint", records, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPerformanceCounterDataCollector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DataSourceName := CallbackCreate(GetMethod(implObj, "get_DataSourceName"), flags, 2)
        this.vtbl.put_DataSourceName := CallbackCreate(GetMethod(implObj, "put_DataSourceName"), flags, 2)
        this.vtbl.get_PerformanceCounters := CallbackCreate(GetMethod(implObj, "get_PerformanceCounters"), flags, 2)
        this.vtbl.put_PerformanceCounters := CallbackCreate(GetMethod(implObj, "put_PerformanceCounters"), flags, 2)
        this.vtbl.get_LogFileFormat := CallbackCreate(GetMethod(implObj, "get_LogFileFormat"), flags, 2)
        this.vtbl.put_LogFileFormat := CallbackCreate(GetMethod(implObj, "put_LogFileFormat"), flags, 2)
        this.vtbl.get_SampleInterval := CallbackCreate(GetMethod(implObj, "get_SampleInterval"), flags, 2)
        this.vtbl.put_SampleInterval := CallbackCreate(GetMethod(implObj, "put_SampleInterval"), flags, 2)
        this.vtbl.get_SegmentMaxRecords := CallbackCreate(GetMethod(implObj, "get_SegmentMaxRecords"), flags, 2)
        this.vtbl.put_SegmentMaxRecords := CallbackCreate(GetMethod(implObj, "put_SegmentMaxRecords"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DataSourceName)
        CallbackFree(this.vtbl.put_DataSourceName)
        CallbackFree(this.vtbl.get_PerformanceCounters)
        CallbackFree(this.vtbl.put_PerformanceCounters)
        CallbackFree(this.vtbl.get_LogFileFormat)
        CallbackFree(this.vtbl.put_LogFileFormat)
        CallbackFree(this.vtbl.get_SampleInterval)
        CallbackFree(this.vtbl.put_SampleInterval)
        CallbackFree(this.vtbl.get_SegmentMaxRecords)
        CallbackFree(this.vtbl.put_SegmentMaxRecords)
    }
}
