#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ClockType.ahk" { ClockType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITraceDataProviderCollection.ahk" { ITraceDataProviderCollection }
#Import ".\StreamMode.ahk" { StreamMode }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IDataCollector.ahk" { IDataCollector }

/**
 * Collects trace events from registered providers.This interface defines the trace session.
 * @remarks
 * The following example shows the XML that you can use to initialize this object if you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorcollection-createdatacollectorfromxml">IDataCollectorCollection::CreateDataCollectorFromXml</a> method to create it. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_xml">The IDataCollector::Xml</a> property also returns this XML.
 * 
 * 
 * ```xml
 * <tr>
 *     <BufferSize/>
 *     <BuffersLost/>  <!-- Output only -->
 *     <BuffersWritten/>  <!-- Output only -->
 *     <ClockType/>
 *     <EventsLost/>  <!-- Output only -->
 *     <ExtendedMode/>
 *     <FlushTimer/>
 *     <FreeBuffers/>  <!-- Output only -->
 *     <Guid/>
 *     <IsKernelTrace/>
 *     <MaximumBuffers/>
 *     <MinimumBuffers/>
 *     <NumberOfBuffers/>
 *     <PreallocateFile/>
 *     <ProcessMode/>
 *     <RealTimeBuffersLost/>  <!-- Output only -->
 *     <SessionId/>  <!-- Output only -->
 *     <SessionName/>
 *     <SessionThreadId/>  <!-- Output only -->
 *     <StreamMode/>
 *     <tr>  <!-- Specify for each provider -->
 *         <DisplayName/>
 *         <FilterData/>
 *         <FilterType/>
 *         <Guid/>
 *         <KeywordsAll>
 *             <Description/>
 *             <ValueMapType/>
 *             <Value/>
 *         </KeywordsAll>
 *         <KeywordsAny>
 *             <Description/>
 *             <ValueMapType/>
 *             <Value/>
 *         <KeywordsAny/>
 *         <Level>
 *             <Description/>
 *             <ValueMapType/>
 *             <Value/>
 *         <Level/>
 *         <Properties/>
 *     </TraceDataProvider>
 * </TraceDataCollector>
 * ```
 * 
 * 
 * Note that the example does not show the property elements inherited from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a> that you also need to specify.
 * 
 * When you specify the XML to create the collector, you can specify only the elements for the properties that you want to set. If you do not specify a property, PLA provides a default value. When you retrieve the XML for the collector, the XML provides all elements, including those from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a>.
 * @see https://learn.microsoft.com/windows/win32/api/pla/nn-pla-itracedatacollector
 * @namespace Windows.Win32.System.Performance
 */
export default struct ITraceDataCollector extends IDataCollector {
    /**
     * The interface identifier for ITraceDataCollector
     * @type {Guid}
     */
    static IID := Guid("{0383750b-098b-11d8-9414-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITraceDataCollector interfaces
    */
    struct Vtbl extends IDataCollector.Vtbl {
        get_BufferSize          : IntPtr
        put_BufferSize          : IntPtr
        get_BuffersLost         : IntPtr
        put_BuffersLost         : IntPtr
        get_BuffersWritten      : IntPtr
        put_BuffersWritten      : IntPtr
        get_ClockType           : IntPtr
        put_ClockType           : IntPtr
        get_EventsLost          : IntPtr
        put_EventsLost          : IntPtr
        get_ExtendedModes       : IntPtr
        put_ExtendedModes       : IntPtr
        get_FlushTimer          : IntPtr
        put_FlushTimer          : IntPtr
        get_FreeBuffers         : IntPtr
        put_FreeBuffers         : IntPtr
        get_Guid                : IntPtr
        put_Guid                : IntPtr
        get_IsKernelTrace       : IntPtr
        get_MaximumBuffers      : IntPtr
        put_MaximumBuffers      : IntPtr
        get_MinimumBuffers      : IntPtr
        put_MinimumBuffers      : IntPtr
        get_NumberOfBuffers     : IntPtr
        put_NumberOfBuffers     : IntPtr
        get_PreallocateFile     : IntPtr
        put_PreallocateFile     : IntPtr
        get_ProcessMode         : IntPtr
        put_ProcessMode         : IntPtr
        get_RealTimeBuffersLost : IntPtr
        put_RealTimeBuffersLost : IntPtr
        get_SessionId           : IntPtr
        put_SessionId           : IntPtr
        get_SessionName         : IntPtr
        put_SessionName         : IntPtr
        get_SessionThreadId     : IntPtr
        put_SessionThreadId     : IntPtr
        get_StreamMode          : IntPtr
        put_StreamMode          : IntPtr
        get_TraceDataProviders  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITraceDataCollector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    BufferSize {
        get => this.get_BufferSize()
        set => this.put_BufferSize(value)
    }

    /**
     * @type {Integer} 
     */
    BuffersLost {
        get => this.get_BuffersLost()
        set => this.put_BuffersLost(value)
    }

    /**
     * @type {Integer} 
     */
    BuffersWritten {
        get => this.get_BuffersWritten()
        set => this.put_BuffersWritten(value)
    }

    /**
     * @type {ClockType} 
     */
    ClockType {
        get => this.get_ClockType()
        set => this.put_ClockType(value)
    }

    /**
     * @type {Integer} 
     */
    EventsLost {
        get => this.get_EventsLost()
        set => this.put_EventsLost(value)
    }

    /**
     * @type {Integer} 
     */
    ExtendedModes {
        get => this.get_ExtendedModes()
        set => this.put_ExtendedModes(value)
    }

    /**
     * @type {Integer} 
     */
    FlushTimer {
        get => this.get_FlushTimer()
        set => this.put_FlushTimer(value)
    }

    /**
     * @type {Integer} 
     */
    FreeBuffers {
        get => this.get_FreeBuffers()
        set => this.put_FreeBuffers(value)
    }

    /**
     * @type {Guid} 
     */
    Guid {
        get => this.get_Guid()
        set => this.put_Guid(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsKernelTrace {
        get => this.get_IsKernelTrace()
    }

    /**
     * @type {Integer} 
     */
    MaximumBuffers {
        get => this.get_MaximumBuffers()
        set => this.put_MaximumBuffers(value)
    }

    /**
     * @type {Integer} 
     */
    MinimumBuffers {
        get => this.get_MinimumBuffers()
        set => this.put_MinimumBuffers(value)
    }

    /**
     * @type {Integer} 
     */
    NumberOfBuffers {
        get => this.get_NumberOfBuffers()
        set => this.put_NumberOfBuffers(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    PreallocateFile {
        get => this.get_PreallocateFile()
        set => this.put_PreallocateFile(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ProcessMode {
        get => this.get_ProcessMode()
        set => this.put_ProcessMode(value)
    }

    /**
     * @type {Integer} 
     */
    RealTimeBuffersLost {
        get => this.get_RealTimeBuffersLost()
        set => this.put_RealTimeBuffersLost(value)
    }

    /**
     * @type {Integer} 
     */
    SessionId {
        get => this.get_SessionId()
        set => this.put_SessionId(value)
    }

    /**
     * @type {BSTR} 
     */
    SessionName {
        get => this.get_SessionName()
        set => this.put_SessionName(value)
    }

    /**
     * @type {Integer} 
     */
    SessionThreadId {
        get => this.get_SessionThreadId()
        set => this.put_SessionThreadId(value)
    }

    /**
     * @type {StreamMode} 
     */
    StreamMode {
        get => this.get_StreamMode()
        set => this.put_StreamMode(value)
    }

    /**
     * @type {ITraceDataProviderCollection} 
     */
    TraceDataProviders {
        get => this.get_TraceDataProviders()
    }

    /**
     * Retrieves or sets the suggested buffer size for each buffer in the event tracing session. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_buffersize
     */
    get_BufferSize() {
        result := ComCall(32, this, "uint*", &_size := 0, "HRESULT")
        return _size
    }

    /**
     * Retrieves or sets the suggested buffer size for each buffer in the event tracing session. (Put)
     * @param {Integer} _size 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_buffersize
     */
    put_BufferSize(_size) {
        result := ComCall(33, this, "uint", _size, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of buffers that were not written to the log file.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_bufferslost
     */
    get_BuffersLost() {
        result := ComCall(34, this, "uint*", &buffers := 0, "HRESULT")
        return buffers
    }

    /**
     * 
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     */
    put_BuffersLost(buffers) {
        result := ComCall(35, this, "uint", buffers, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of buffers written to the log file.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_bufferswritten
     */
    get_BuffersWritten() {
        result := ComCall(36, this, "uint*", &buffers := 0, "HRESULT")
        return buffers
    }

    /**
     * 
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     */
    put_BuffersWritten(buffers) {
        result := ComCall(37, this, "uint", buffers, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the clock resolution to use when logging the time stamp for each event. (Get)
     * @returns {ClockType} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_clocktype
     */
    get_ClockType() {
        result := ComCall(38, this, "int*", &clock := 0, "HRESULT")
        return clock
    }

    /**
     * Retrieves or sets the clock resolution to use when logging the time stamp for each event. (Put)
     * @param {ClockType} clock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_clocktype
     */
    put_ClockType(clock) {
        result := ComCall(39, this, ClockType, clock, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of events that were not written to the buffer.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_eventslost
     */
    get_EventsLost() {
        result := ComCall(40, this, "uint*", &events := 0, "HRESULT")
        return events
    }

    /**
     * 
     * @param {Integer} events 
     * @returns {HRESULT} 
     */
    put_EventsLost(events) {
        result := ComCall(41, this, "uint", events, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the extended log file modes. (Get)
     * @remarks
     * Use this property to set the following log file modes:
     * 
     * <ul>
     * <li>EVENT_TRACE_PRIVATE_IN_PROC</li>
     * <li>EVENT_TRACE_USE_GLOBAL_SEQUENCE</li>
     * <li>EVENT_TRACE_USE_LOCAL_SEQUENCE</li>
     * <li>EVENT_TRACE_USE_PAGED_MEMORY</li>
     * </ul>
     * For a description of all log file modes and their values, see <a href="https://docs.microsoft.com/windows/desktop/ETW/logging-mode-constants">Logging Mode Constants</a>. To set the other available log file modes, set the corresponding PLA property as shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Log file mode</th>
     * <th>Corresponding PLA property</th>
     * </tr>
     * <tr>
     * <td>EVENT_TRACE_BUFFERING_MODE</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-itracedatacollector-get_streammode">ITraceDataProvider::StreamMode</a> is set to <b>plaBuffering</b>.</td>
     * </tr>
     * <tr>
     * <td>EVENT_TRACE_FILE_MODE_APPEND</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logappend">IDataCollector::LogAppend</a>.</td>
     * </tr>
     * <tr>
     * <td>EVENT_TRACE_FILE_MODE_CIRCULAR</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logcircular">IDataCollector::LogCircular</a>.</td>
     * </tr>
     * <tr>
     * <td>EVENT_TRACE_FILE_MODE_NEWFILE</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segment">IDataCollectorSet::Segment</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segmentmaxsize">IDataCollectorSet::SegmentMaxSize</a>.</td>
     * </tr>
     * <tr>
     * <td>EVENT_TRACE_FILE_MODE_PREALLOCATE</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-itracedatacollector-get_preallocatefile">ITraceDataCollector::PreallocateFile</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segmentmaxsize">IDataCollectorSet::SegmentMaxSize</a>.</td>
     * </tr>
     * <tr>
     * <td>EVENT_TRACE_FILE_MODE_SEQUENTIAL</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logappend">IDataCollector::LogAppend</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logcircular">IDataCollector::LogCircular</a> are false.</td>
     * </tr>
     * <tr>
     * <td>EVENT_TRACE_PRIVATE_LOGGER_MODE</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-itracedatacollector-get_processmode">ITraceDataProvider::ProcessMode</a>.</td>
     * </tr>
     * <tr>
     * <td>EVENT_TRACE_REAL_TIME_MODE</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-itracedatacollector-get_streammode">ITraceDataProvider::StreamMode</a> is set to <b>plaRealTime</b>.</td>
     * </tr>
     * </table>
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_extendedmodes
     */
    get_ExtendedModes() {
        result := ComCall(42, this, "uint*", &_mode := 0, "HRESULT")
        return _mode
    }

    /**
     * Retrieves or sets the extended log file modes. (Put)
     * @remarks
     * Use this property to set the following log file modes:
     * 
     * <ul>
     * <li>EVENT_TRACE_PRIVATE_IN_PROC</li>
     * <li>EVENT_TRACE_USE_GLOBAL_SEQUENCE</li>
     * <li>EVENT_TRACE_USE_LOCAL_SEQUENCE</li>
     * <li>EVENT_TRACE_USE_PAGED_MEMORY</li>
     * </ul>
     * For a description of all log file modes and their values, see <a href="https://docs.microsoft.com/windows/desktop/ETW/logging-mode-constants">Logging Mode Constants</a>. To set the other available log file modes, set the corresponding PLA property as shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Log file mode</th>
     * <th>Corresponding PLA property</th>
     * </tr>
     * <tr>
     * <td>EVENT_TRACE_BUFFERING_MODE</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-itracedatacollector-get_streammode">ITraceDataProvider::StreamMode</a> is set to <b>plaBuffering</b>.</td>
     * </tr>
     * <tr>
     * <td>EVENT_TRACE_FILE_MODE_APPEND</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logappend">IDataCollector::LogAppend</a>.</td>
     * </tr>
     * <tr>
     * <td>EVENT_TRACE_FILE_MODE_CIRCULAR</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logcircular">IDataCollector::LogCircular</a>.</td>
     * </tr>
     * <tr>
     * <td>EVENT_TRACE_FILE_MODE_NEWFILE</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segment">IDataCollectorSet::Segment</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segmentmaxsize">IDataCollectorSet::SegmentMaxSize</a>.</td>
     * </tr>
     * <tr>
     * <td>EVENT_TRACE_FILE_MODE_PREALLOCATE</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-itracedatacollector-get_preallocatefile">ITraceDataCollector::PreallocateFile</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segmentmaxsize">IDataCollectorSet::SegmentMaxSize</a>.</td>
     * </tr>
     * <tr>
     * <td>EVENT_TRACE_FILE_MODE_SEQUENTIAL</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logappend">IDataCollector::LogAppend</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logcircular">IDataCollector::LogCircular</a> are false.</td>
     * </tr>
     * <tr>
     * <td>EVENT_TRACE_PRIVATE_LOGGER_MODE</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-itracedatacollector-get_processmode">ITraceDataProvider::ProcessMode</a>.</td>
     * </tr>
     * <tr>
     * <td>EVENT_TRACE_REAL_TIME_MODE</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-itracedatacollector-get_streammode">ITraceDataProvider::StreamMode</a> is set to <b>plaRealTime</b>.</td>
     * </tr>
     * </table>
     * @param {Integer} _mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_extendedmodes
     */
    put_ExtendedModes(_mode) {
        result := ComCall(43, this, "uint", _mode, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the time to wait before flushing buffers. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_flushtimer
     */
    get_FlushTimer() {
        result := ComCall(44, this, "uint*", &seconds := 0, "HRESULT")
        return seconds
    }

    /**
     * Retrieves or sets the time to wait before flushing buffers. (Put)
     * @param {Integer} seconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_flushtimer
     */
    put_FlushTimer(seconds) {
        result := ComCall(45, this, "uint", seconds, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of buffers that are allocated but unused in the event tracing session's buffer pool.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_freebuffers
     */
    get_FreeBuffers() {
        result := ComCall(46, this, "uint*", &buffers := 0, "HRESULT")
        return buffers
    }

    /**
     * 
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     */
    put_FreeBuffers(buffers) {
        result := ComCall(47, this, "uint", buffers, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the session GUID. (Get)
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_guid
     */
    get_Guid() {
        guid := Guid()
        result := ComCall(48, this, Guid.Ptr, guid, "HRESULT")
        return guid
    }

    /**
     * Retrieves or sets the session GUID. (Put)
     * @param {Guid} guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_guid
     */
    put_Guid(guid) {
        result := ComCall(49, this, Guid, guid, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates whether the trace contains kernel providers.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_iskerneltrace
     */
    get_IsKernelTrace() {
        result := ComCall(50, this, VARIANT_BOOL.Ptr, &kernel := 0, "HRESULT")
        return kernel
    }

    /**
     * Retrieves or sets the maximum number of buffers allocated for the event tracing session's buffer pool. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_maximumbuffers
     */
    get_MaximumBuffers() {
        result := ComCall(51, this, "uint*", &buffers := 0, "HRESULT")
        return buffers
    }

    /**
     * Retrieves or sets the maximum number of buffers allocated for the event tracing session's buffer pool. (Put)
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_maximumbuffers
     */
    put_MaximumBuffers(buffers) {
        result := ComCall(52, this, "uint", buffers, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the minimum number of buffers allocated for the event tracing session's buffer pool. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_minimumbuffers
     */
    get_MinimumBuffers() {
        result := ComCall(53, this, "uint*", &buffers := 0, "HRESULT")
        return buffers
    }

    /**
     * Retrieves or sets the minimum number of buffers allocated for the event tracing session's buffer pool. (Put)
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_minimumbuffers
     */
    put_MinimumBuffers(buffers) {
        result := ComCall(54, this, "uint", buffers, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the suggested number of buffers to use for logging. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_numberofbuffers
     */
    get_NumberOfBuffers() {
        result := ComCall(55, this, "uint*", &buffers := 0, "HRESULT")
        return buffers
    }

    /**
     * Retrieves or sets the suggested number of buffers to use for logging. (Put)
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_numberofbuffers
     */
    put_NumberOfBuffers(buffers) {
        result := ComCall(56, this, "uint", buffers, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that indicates whether PLA should allocate the entire log file size before logging. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_preallocatefile
     */
    get_PreallocateFile() {
        result := ComCall(57, this, VARIANT_BOOL.Ptr, &allocate := 0, "HRESULT")
        return allocate
    }

    /**
     * Retrieves or sets a value that indicates whether PLA should allocate the entire log file size before logging. (Put)
     * @param {VARIANT_BOOL} allocate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_preallocatefile
     */
    put_PreallocateFile(allocate) {
        result := ComCall(58, this, VARIANT_BOOL, allocate, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that indicates whether the session is a private, in-process session. (Get)
     * @remarks
     * A private event tracing session is a user-mode event tracing session that runs in the same process as its event trace providers—the registered providers that the private session enables and the private session must all be in the same process.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_processmode
     */
    get_ProcessMode() {
        result := ComCall(59, this, VARIANT_BOOL.Ptr, &process := 0, "HRESULT")
        return process
    }

    /**
     * Retrieves or sets a value that indicates whether the session is a private, in-process session. (Put)
     * @remarks
     * A private event tracing session is a user-mode event tracing session that runs in the same process as its event trace providers—the registered providers that the private session enables and the private session must all be in the same process.
     * @param {VARIANT_BOOL} process 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_processmode
     */
    put_ProcessMode(process) {
        result := ComCall(60, this, VARIANT_BOOL, process, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of buffers that were not delivered in real time to the consumer.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_realtimebufferslost
     */
    get_RealTimeBuffersLost() {
        result := ComCall(61, this, "uint*", &buffers := 0, "HRESULT")
        return buffers
    }

    /**
     * 
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     */
    put_RealTimeBuffersLost(buffers) {
        result := ComCall(62, this, "uint", buffers, "HRESULT")
        return result
    }

    /**
     * Retrieves the session identifier.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_sessionid
     */
    get_SessionId() {
        result := ComCall(63, this, "uint*", &id := 0, "HRESULT")
        return id
    }

    /**
     * 
     * @param {Integer} id 
     * @returns {HRESULT} 
     */
    put_SessionId(id) {
        result := ComCall(64, this, "uint", id, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the name of the session. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_sessionname
     */
    get_SessionName() {
        name := BSTR.Owned()
        result := ComCall(65, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * Retrieves or sets the name of the session. (Put)
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_sessionname
     */
    put_SessionName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(66, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * Retrieves the current thread of the log session, if the thread is running.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_sessionthreadid
     */
    get_SessionThreadId() {
        result := ComCall(67, this, "uint*", &tid := 0, "HRESULT")
        return tid
    }

    /**
     * 
     * @param {Integer} tid 
     * @returns {HRESULT} 
     */
    put_SessionThreadId(tid) {
        result := ComCall(68, this, "uint", tid, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the logging mode of the trace session. (Get)
     * @returns {StreamMode} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_streammode
     */
    get_StreamMode() {
        result := ComCall(69, this, "int*", &_mode := 0, "HRESULT")
        return _mode
    }

    /**
     * Retrieves or sets the logging mode of the trace session. (Put)
     * @param {StreamMode} _mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_streammode
     */
    put_StreamMode(_mode) {
        result := ComCall(70, this, StreamMode, _mode, "HRESULT")
        return result
    }

    /**
     * Retrieves the list of providers enabled for this trace session.
     * @remarks
     * If the collection contains a kernel provider, all the providers in the collection must be kernel providers.
     * @returns {ITraceDataProviderCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_tracedataproviders
     */
    get_TraceDataProviders() {
        result := ComCall(71, this, "ptr*", &providers := 0, "HRESULT")
        return ITraceDataProviderCollection(providers)
    }

    Query(iid) {
        if (ITraceDataCollector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_BufferSize := CallbackCreate(GetMethod(implObj, "get_BufferSize"), flags, 2)
        this.vtbl.put_BufferSize := CallbackCreate(GetMethod(implObj, "put_BufferSize"), flags, 2)
        this.vtbl.get_BuffersLost := CallbackCreate(GetMethod(implObj, "get_BuffersLost"), flags, 2)
        this.vtbl.put_BuffersLost := CallbackCreate(GetMethod(implObj, "put_BuffersLost"), flags, 2)
        this.vtbl.get_BuffersWritten := CallbackCreate(GetMethod(implObj, "get_BuffersWritten"), flags, 2)
        this.vtbl.put_BuffersWritten := CallbackCreate(GetMethod(implObj, "put_BuffersWritten"), flags, 2)
        this.vtbl.get_ClockType := CallbackCreate(GetMethod(implObj, "get_ClockType"), flags, 2)
        this.vtbl.put_ClockType := CallbackCreate(GetMethod(implObj, "put_ClockType"), flags, 2)
        this.vtbl.get_EventsLost := CallbackCreate(GetMethod(implObj, "get_EventsLost"), flags, 2)
        this.vtbl.put_EventsLost := CallbackCreate(GetMethod(implObj, "put_EventsLost"), flags, 2)
        this.vtbl.get_ExtendedModes := CallbackCreate(GetMethod(implObj, "get_ExtendedModes"), flags, 2)
        this.vtbl.put_ExtendedModes := CallbackCreate(GetMethod(implObj, "put_ExtendedModes"), flags, 2)
        this.vtbl.get_FlushTimer := CallbackCreate(GetMethod(implObj, "get_FlushTimer"), flags, 2)
        this.vtbl.put_FlushTimer := CallbackCreate(GetMethod(implObj, "put_FlushTimer"), flags, 2)
        this.vtbl.get_FreeBuffers := CallbackCreate(GetMethod(implObj, "get_FreeBuffers"), flags, 2)
        this.vtbl.put_FreeBuffers := CallbackCreate(GetMethod(implObj, "put_FreeBuffers"), flags, 2)
        this.vtbl.get_Guid := CallbackCreate(GetMethod(implObj, "get_Guid"), flags, 2)
        this.vtbl.put_Guid := CallbackCreate(GetMethod(implObj, "put_Guid"), flags, 2)
        this.vtbl.get_IsKernelTrace := CallbackCreate(GetMethod(implObj, "get_IsKernelTrace"), flags, 2)
        this.vtbl.get_MaximumBuffers := CallbackCreate(GetMethod(implObj, "get_MaximumBuffers"), flags, 2)
        this.vtbl.put_MaximumBuffers := CallbackCreate(GetMethod(implObj, "put_MaximumBuffers"), flags, 2)
        this.vtbl.get_MinimumBuffers := CallbackCreate(GetMethod(implObj, "get_MinimumBuffers"), flags, 2)
        this.vtbl.put_MinimumBuffers := CallbackCreate(GetMethod(implObj, "put_MinimumBuffers"), flags, 2)
        this.vtbl.get_NumberOfBuffers := CallbackCreate(GetMethod(implObj, "get_NumberOfBuffers"), flags, 2)
        this.vtbl.put_NumberOfBuffers := CallbackCreate(GetMethod(implObj, "put_NumberOfBuffers"), flags, 2)
        this.vtbl.get_PreallocateFile := CallbackCreate(GetMethod(implObj, "get_PreallocateFile"), flags, 2)
        this.vtbl.put_PreallocateFile := CallbackCreate(GetMethod(implObj, "put_PreallocateFile"), flags, 2)
        this.vtbl.get_ProcessMode := CallbackCreate(GetMethod(implObj, "get_ProcessMode"), flags, 2)
        this.vtbl.put_ProcessMode := CallbackCreate(GetMethod(implObj, "put_ProcessMode"), flags, 2)
        this.vtbl.get_RealTimeBuffersLost := CallbackCreate(GetMethod(implObj, "get_RealTimeBuffersLost"), flags, 2)
        this.vtbl.put_RealTimeBuffersLost := CallbackCreate(GetMethod(implObj, "put_RealTimeBuffersLost"), flags, 2)
        this.vtbl.get_SessionId := CallbackCreate(GetMethod(implObj, "get_SessionId"), flags, 2)
        this.vtbl.put_SessionId := CallbackCreate(GetMethod(implObj, "put_SessionId"), flags, 2)
        this.vtbl.get_SessionName := CallbackCreate(GetMethod(implObj, "get_SessionName"), flags, 2)
        this.vtbl.put_SessionName := CallbackCreate(GetMethod(implObj, "put_SessionName"), flags, 2)
        this.vtbl.get_SessionThreadId := CallbackCreate(GetMethod(implObj, "get_SessionThreadId"), flags, 2)
        this.vtbl.put_SessionThreadId := CallbackCreate(GetMethod(implObj, "put_SessionThreadId"), flags, 2)
        this.vtbl.get_StreamMode := CallbackCreate(GetMethod(implObj, "get_StreamMode"), flags, 2)
        this.vtbl.put_StreamMode := CallbackCreate(GetMethod(implObj, "put_StreamMode"), flags, 2)
        this.vtbl.get_TraceDataProviders := CallbackCreate(GetMethod(implObj, "get_TraceDataProviders"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_BufferSize)
        CallbackFree(this.vtbl.put_BufferSize)
        CallbackFree(this.vtbl.get_BuffersLost)
        CallbackFree(this.vtbl.put_BuffersLost)
        CallbackFree(this.vtbl.get_BuffersWritten)
        CallbackFree(this.vtbl.put_BuffersWritten)
        CallbackFree(this.vtbl.get_ClockType)
        CallbackFree(this.vtbl.put_ClockType)
        CallbackFree(this.vtbl.get_EventsLost)
        CallbackFree(this.vtbl.put_EventsLost)
        CallbackFree(this.vtbl.get_ExtendedModes)
        CallbackFree(this.vtbl.put_ExtendedModes)
        CallbackFree(this.vtbl.get_FlushTimer)
        CallbackFree(this.vtbl.put_FlushTimer)
        CallbackFree(this.vtbl.get_FreeBuffers)
        CallbackFree(this.vtbl.put_FreeBuffers)
        CallbackFree(this.vtbl.get_Guid)
        CallbackFree(this.vtbl.put_Guid)
        CallbackFree(this.vtbl.get_IsKernelTrace)
        CallbackFree(this.vtbl.get_MaximumBuffers)
        CallbackFree(this.vtbl.put_MaximumBuffers)
        CallbackFree(this.vtbl.get_MinimumBuffers)
        CallbackFree(this.vtbl.put_MinimumBuffers)
        CallbackFree(this.vtbl.get_NumberOfBuffers)
        CallbackFree(this.vtbl.put_NumberOfBuffers)
        CallbackFree(this.vtbl.get_PreallocateFile)
        CallbackFree(this.vtbl.put_PreallocateFile)
        CallbackFree(this.vtbl.get_ProcessMode)
        CallbackFree(this.vtbl.put_ProcessMode)
        CallbackFree(this.vtbl.get_RealTimeBuffersLost)
        CallbackFree(this.vtbl.put_RealTimeBuffersLost)
        CallbackFree(this.vtbl.get_SessionId)
        CallbackFree(this.vtbl.put_SessionId)
        CallbackFree(this.vtbl.get_SessionName)
        CallbackFree(this.vtbl.put_SessionName)
        CallbackFree(this.vtbl.get_SessionThreadId)
        CallbackFree(this.vtbl.put_SessionThreadId)
        CallbackFree(this.vtbl.get_StreamMode)
        CallbackFree(this.vtbl.put_StreamMode)
        CallbackFree(this.vtbl.get_TraceDataProviders)
    }
}
