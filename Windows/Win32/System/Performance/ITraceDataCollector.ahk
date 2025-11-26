#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITraceDataProviderCollection.ahk
#Include .\IDataCollector.ahk

/**
 * Collects trace events from registered providers.This interface defines the trace session.
 * @remarks
 * 
 * The following example shows the XML that you can use to initialize this object if you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorcollection-createdatacollectorfromxml">IDataCollectorCollection::CreateDataCollectorFromXml</a> method to create it. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_xml">The IDataCollector::Xml</a> property also returns this XML.
 * 
 * 
 * ```xml
 * <TraceDataCollector>
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
 *     <TraceDataProvider>  <!-- Specify for each provider -->
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-itracedatacollector
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ITraceDataCollector extends IDataCollector{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITraceDataCollector
     * @type {Guid}
     */
    static IID => Guid("{0383750b-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BufferSize", "put_BufferSize", "get_BuffersLost", "put_BuffersLost", "get_BuffersWritten", "put_BuffersWritten", "get_ClockType", "put_ClockType", "get_EventsLost", "put_EventsLost", "get_ExtendedModes", "put_ExtendedModes", "get_FlushTimer", "put_FlushTimer", "get_FreeBuffers", "put_FreeBuffers", "get_Guid", "put_Guid", "get_IsKernelTrace", "get_MaximumBuffers", "put_MaximumBuffers", "get_MinimumBuffers", "put_MinimumBuffers", "get_NumberOfBuffers", "put_NumberOfBuffers", "get_PreallocateFile", "put_PreallocateFile", "get_ProcessMode", "put_ProcessMode", "get_RealTimeBuffersLost", "put_RealTimeBuffersLost", "get_SessionId", "put_SessionId", "get_SessionName", "put_SessionName", "get_SessionThreadId", "put_SessionThreadId", "get_StreamMode", "put_StreamMode", "get_TraceDataProviders"]

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
     * @type {Integer} 
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
     * @type {Integer} 
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_buffersize
     */
    get_BufferSize() {
        result := ComCall(32, this, "uint*", &size := 0, "HRESULT")
        return size
    }

    /**
     * 
     * @param {Integer} size 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_buffersize
     */
    put_BufferSize(size) {
        result := ComCall(33, this, "uint", size, "HRESULT")
        return result
    }

    /**
     * 
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
     * 
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_clocktype
     */
    get_ClockType() {
        result := ComCall(38, this, "int*", &clock := 0, "HRESULT")
        return clock
    }

    /**
     * 
     * @param {Integer} clock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_clocktype
     */
    put_ClockType(clock) {
        result := ComCall(39, this, "int", clock, "HRESULT")
        return result
    }

    /**
     * 
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_extendedmodes
     */
    get_ExtendedModes() {
        result := ComCall(42, this, "uint*", &mode := 0, "HRESULT")
        return mode
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_extendedmodes
     */
    put_ExtendedModes(mode) {
        result := ComCall(43, this, "uint", mode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_flushtimer
     */
    get_FlushTimer() {
        result := ComCall(44, this, "uint*", &seconds := 0, "HRESULT")
        return seconds
    }

    /**
     * 
     * @param {Integer} seconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_flushtimer
     */
    put_FlushTimer(seconds) {
        result := ComCall(45, this, "uint", seconds, "HRESULT")
        return result
    }

    /**
     * 
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
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_guid
     */
    get_Guid() {
        guid := Guid()
        result := ComCall(48, this, "ptr", guid, "HRESULT")
        return guid
    }

    /**
     * 
     * @param {Guid} guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_guid
     */
    put_Guid(guid) {
        result := ComCall(49, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_iskerneltrace
     */
    get_IsKernelTrace() {
        result := ComCall(50, this, "short*", &kernel := 0, "HRESULT")
        return kernel
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_maximumbuffers
     */
    get_MaximumBuffers() {
        result := ComCall(51, this, "uint*", &buffers := 0, "HRESULT")
        return buffers
    }

    /**
     * 
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_maximumbuffers
     */
    put_MaximumBuffers(buffers) {
        result := ComCall(52, this, "uint", buffers, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_minimumbuffers
     */
    get_MinimumBuffers() {
        result := ComCall(53, this, "uint*", &buffers := 0, "HRESULT")
        return buffers
    }

    /**
     * 
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_minimumbuffers
     */
    put_MinimumBuffers(buffers) {
        result := ComCall(54, this, "uint", buffers, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_numberofbuffers
     */
    get_NumberOfBuffers() {
        result := ComCall(55, this, "uint*", &buffers := 0, "HRESULT")
        return buffers
    }

    /**
     * 
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_numberofbuffers
     */
    put_NumberOfBuffers(buffers) {
        result := ComCall(56, this, "uint", buffers, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_preallocatefile
     */
    get_PreallocateFile() {
        result := ComCall(57, this, "short*", &allocate := 0, "HRESULT")
        return allocate
    }

    /**
     * 
     * @param {VARIANT_BOOL} allocate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_preallocatefile
     */
    put_PreallocateFile(allocate) {
        result := ComCall(58, this, "short", allocate, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_processmode
     */
    get_ProcessMode() {
        result := ComCall(59, this, "short*", &process := 0, "HRESULT")
        return process
    }

    /**
     * 
     * @param {VARIANT_BOOL} process 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_processmode
     */
    put_ProcessMode(process) {
        result := ComCall(60, this, "short", process, "HRESULT")
        return result
    }

    /**
     * 
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
     * 
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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_sessionname
     */
    get_SessionName() {
        name := BSTR()
        result := ComCall(65, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_sessionname
     */
    put_SessionName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(66, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_streammode
     */
    get_StreamMode() {
        result := ComCall(69, this, "int*", &mode := 0, "HRESULT")
        return mode
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-put_streammode
     */
    put_StreamMode(mode) {
        result := ComCall(70, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITraceDataProviderCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-itracedatacollector-get_tracedataproviders
     */
    get_TraceDataProviders() {
        result := ComCall(71, this, "ptr*", &providers := 0, "HRESULT")
        return ITraceDataProviderCollection(providers)
    }
}
