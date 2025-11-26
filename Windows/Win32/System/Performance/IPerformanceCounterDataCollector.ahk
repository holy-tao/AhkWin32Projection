#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDataCollector.ahk

/**
 * Specifies the performance counters to query and the log file to which the counter data is written.To create this data collector, call the IDataCollectorCollection::CreateDataCollector or IDataCollectorCollection::CreateDataCollectorFromXml method.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-iperformancecounterdatacollector
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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-get_datasourcename
     */
    get_DataSourceName() {
        dsn := BSTR()
        result := ComCall(32, this, "ptr", dsn, "HRESULT")
        return dsn
    }

    /**
     * 
     * @param {BSTR} dsn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-put_datasourcename
     */
    put_DataSourceName(dsn) {
        dsn := dsn is String ? BSTR.Alloc(dsn).Value : dsn

        result := ComCall(33, this, "ptr", dsn, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-get_performancecounters
     */
    get_PerformanceCounters() {
        result := ComCall(34, this, "ptr*", &counters := 0, "HRESULT")
        return counters
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} counters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-put_performancecounters
     */
    put_PerformanceCounters(counters) {
        result := ComCall(35, this, "ptr", counters, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-get_logfileformat
     */
    get_LogFileFormat() {
        result := ComCall(36, this, "int*", &format := 0, "HRESULT")
        return format
    }

    /**
     * 
     * @param {Integer} format 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-put_logfileformat
     */
    put_LogFileFormat(format) {
        result := ComCall(37, this, "int", format, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-get_sampleinterval
     */
    get_SampleInterval() {
        result := ComCall(38, this, "uint*", &interval := 0, "HRESULT")
        return interval
    }

    /**
     * 
     * @param {Integer} interval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-put_sampleinterval
     */
    put_SampleInterval(interval) {
        result := ComCall(39, this, "uint", interval, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-get_segmentmaxrecords
     */
    get_SegmentMaxRecords() {
        result := ComCall(40, this, "uint*", &records := 0, "HRESULT")
        return records
    }

    /**
     * 
     * @param {Integer} records 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iperformancecounterdatacollector-put_segmentmaxrecords
     */
    put_SegmentMaxRecords(records) {
        result := ComCall(41, this, "uint", records, "HRESULT")
        return result
    }
}
