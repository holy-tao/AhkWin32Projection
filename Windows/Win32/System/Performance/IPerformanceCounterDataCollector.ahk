#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDataCollector.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/pla/nn-pla-iperformancecounterdatacollector
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class IPerformanceCounterDataCollector extends IDataCollector{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerformanceCounterDataCollector
     * @type {Guid}
     */
    static IID => Guid("{03837506-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DataSourceName", "put_DataSourceName", "get_PerformanceCounters", "put_PerformanceCounters", "get_LogFileFormat", "put_LogFileFormat", "get_SampleInterval", "put_SampleInterval", "get_SegmentMaxRecords", "put_SegmentMaxRecords"]

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
     * @type {Integer} 
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
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-iperformancecounterdatacollector-get_datasourcename
     */
    get_DataSourceName() {
        dsn := BSTR()
        result := ComCall(32, this, "ptr", dsn, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return dsn
    }

    /**
     * Retrieves or sets the data source name if the log file is an SQL log file. (Put)
     * @remarks
     * Specify the data source name only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-iperformancecounterdatacollector-get_logfileformat">IPerformanceCounterDataCollector::LogFileFormat</a> property is <b>plaSql</b>.
     * @param {BSTR} dsn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-iperformancecounterdatacollector-put_datasourcename
     */
    put_DataSourceName(dsn) {
        if(dsn is String) {
            pin := BSTR.Alloc(dsn)
            dsn := pin.Value
        }

        result := ComCall(33, this, "ptr", dsn, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves or sets the performance counters to query. (Get)
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-iperformancecounterdatacollector-get_performancecounters
     */
    get_PerformanceCounters() {
        result := ComCall(34, this, "ptr*", &counters_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return counters_
    }

    /**
     * Retrieves or sets the performance counters to query. (Put)
     * @param {Pointer<SAFEARRAY>} counters_ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-iperformancecounterdatacollector-put_performancecounters
     */
    put_PerformanceCounters(counters_) {
        result := ComCall(35, this, "ptr", counters_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves or sets the format of the log file. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-iperformancecounterdatacollector-get_logfileformat
     */
    get_LogFileFormat() {
        result := ComCall(36, this, "int*", &format := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return format
    }

    /**
     * Retrieves or sets the format of the log file. (Put)
     * @param {Integer} format 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-iperformancecounterdatacollector-put_logfileformat
     */
    put_LogFileFormat(format) {
        result := ComCall(37, this, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves or sets the interval to wait between sampling counter data. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-iperformancecounterdatacollector-get_sampleinterval
     */
    get_SampleInterval() {
        result := ComCall(38, this, "uint*", &interval_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return interval_
    }

    /**
     * Retrieves or sets the interval to wait between sampling counter data. (Put)
     * @param {Integer} interval_ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-iperformancecounterdatacollector-put_sampleinterval
     */
    put_SampleInterval(interval_) {
        result := ComCall(39, this, "uint", interval_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves or sets the maximum number of samples to log. (Get)
     * @remarks
     * When the maximum number of samples is reached, PLA switches to a new log file and continues logging if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segment">IDataCollectorSet::Segment</a> property is VARIANT_TRUE; otherwise, PLA stops logging.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-iperformancecounterdatacollector-get_segmentmaxrecords
     */
    get_SegmentMaxRecords() {
        result := ComCall(40, this, "uint*", &records := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return records
    }

    /**
     * Retrieves or sets the maximum number of samples to log. (Put)
     * @remarks
     * When the maximum number of samples is reached, PLA switches to a new log file and continues logging if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segment">IDataCollectorSet::Segment</a> property is VARIANT_TRUE; otherwise, PLA stops logging.
     * @param {Integer} records 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/pla/nf-pla-iperformancecounterdatacollector-put_segmentmaxrecords
     */
    put_SegmentMaxRecords(records) {
        result := ComCall(41, this, "uint", records, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
