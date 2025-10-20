#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<UInt32>} size 
     * @returns {HRESULT} 
     */
    get_BufferSize(size) {
        result := ComCall(32, this, "uint*", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} size 
     * @returns {HRESULT} 
     */
    put_BufferSize(size) {
        result := ComCall(33, this, "uint", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} buffers 
     * @returns {HRESULT} 
     */
    get_BuffersLost(buffers) {
        result := ComCall(34, this, "uint*", buffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     */
    put_BuffersLost(buffers) {
        result := ComCall(35, this, "uint", buffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} buffers 
     * @returns {HRESULT} 
     */
    get_BuffersWritten(buffers) {
        result := ComCall(36, this, "uint*", buffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     */
    put_BuffersWritten(buffers) {
        result := ComCall(37, this, "uint", buffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} clock 
     * @returns {HRESULT} 
     */
    get_ClockType(clock) {
        result := ComCall(38, this, "int*", clock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} clock 
     * @returns {HRESULT} 
     */
    put_ClockType(clock) {
        result := ComCall(39, this, "int", clock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} events 
     * @returns {HRESULT} 
     */
    get_EventsLost(events) {
        result := ComCall(40, this, "uint*", events, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} events 
     * @returns {HRESULT} 
     */
    put_EventsLost(events) {
        result := ComCall(41, this, "uint", events, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} mode 
     * @returns {HRESULT} 
     */
    get_ExtendedModes(mode) {
        result := ComCall(42, this, "uint*", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    put_ExtendedModes(mode) {
        result := ComCall(43, this, "uint", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} seconds 
     * @returns {HRESULT} 
     */
    get_FlushTimer(seconds) {
        result := ComCall(44, this, "uint*", seconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} seconds 
     * @returns {HRESULT} 
     */
    put_FlushTimer(seconds) {
        result := ComCall(45, this, "uint", seconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} buffers 
     * @returns {HRESULT} 
     */
    get_FreeBuffers(buffers) {
        result := ComCall(46, this, "uint*", buffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     */
    put_FreeBuffers(buffers) {
        result := ComCall(47, this, "uint", buffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {HRESULT} 
     */
    get_Guid(guid) {
        result := ComCall(48, this, "ptr", guid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {HRESULT} 
     */
    put_Guid(guid) {
        result := ComCall(49, this, "ptr", guid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} kernel 
     * @returns {HRESULT} 
     */
    get_IsKernelTrace(kernel) {
        result := ComCall(50, this, "ptr", kernel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} buffers 
     * @returns {HRESULT} 
     */
    get_MaximumBuffers(buffers) {
        result := ComCall(51, this, "uint*", buffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     */
    put_MaximumBuffers(buffers) {
        result := ComCall(52, this, "uint", buffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} buffers 
     * @returns {HRESULT} 
     */
    get_MinimumBuffers(buffers) {
        result := ComCall(53, this, "uint*", buffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     */
    put_MinimumBuffers(buffers) {
        result := ComCall(54, this, "uint", buffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} buffers 
     * @returns {HRESULT} 
     */
    get_NumberOfBuffers(buffers) {
        result := ComCall(55, this, "uint*", buffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     */
    put_NumberOfBuffers(buffers) {
        result := ComCall(56, this, "uint", buffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} allocate 
     * @returns {HRESULT} 
     */
    get_PreallocateFile(allocate) {
        result := ComCall(57, this, "ptr", allocate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} allocate 
     * @returns {HRESULT} 
     */
    put_PreallocateFile(allocate) {
        result := ComCall(58, this, "short", allocate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} process 
     * @returns {HRESULT} 
     */
    get_ProcessMode(process) {
        result := ComCall(59, this, "ptr", process, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} process 
     * @returns {HRESULT} 
     */
    put_ProcessMode(process) {
        result := ComCall(60, this, "short", process, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} buffers 
     * @returns {HRESULT} 
     */
    get_RealTimeBuffersLost(buffers) {
        result := ComCall(61, this, "uint*", buffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} buffers 
     * @returns {HRESULT} 
     */
    put_RealTimeBuffersLost(buffers) {
        result := ComCall(62, this, "uint", buffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} id 
     * @returns {HRESULT} 
     */
    get_SessionId(id) {
        result := ComCall(63, this, "uint*", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @returns {HRESULT} 
     */
    put_SessionId(id) {
        result := ComCall(64, this, "uint", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_SessionName(name) {
        result := ComCall(65, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    put_SessionName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(66, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} tid 
     * @returns {HRESULT} 
     */
    get_SessionThreadId(tid) {
        result := ComCall(67, this, "uint*", tid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tid 
     * @returns {HRESULT} 
     */
    put_SessionThreadId(tid) {
        result := ComCall(68, this, "uint", tid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} mode 
     * @returns {HRESULT} 
     */
    get_StreamMode(mode) {
        result := ComCall(69, this, "int*", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    put_StreamMode(mode) {
        result := ComCall(70, this, "int", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITraceDataProviderCollection>} providers 
     * @returns {HRESULT} 
     */
    get_TraceDataProviders(providers) {
        result := ComCall(71, this, "ptr", providers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
