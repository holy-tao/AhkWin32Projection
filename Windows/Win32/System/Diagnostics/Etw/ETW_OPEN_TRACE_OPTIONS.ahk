#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ETW_PROCESS_TRACE_MODES.ahk" { ETW_PROCESS_TRACE_MODES }

/**
 * Provides configuration parameters to OpenTraceFromBufferStream, OpenTraceFromFile, OpenTraceFromRealTimeLogger, OpenTraceFromRealTimeLoggerWithAllocationOptions functions.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-etw_open_trace_options
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct ETW_OPEN_TRACE_OPTIONS {
    #StructPack 8

    /**
     * A bitfield enum providing further configurations for the processing sessions. Current supported values:
     * 
     * - ETW_PROCESS_TRACE_MODE_NONE
     * - ETW_PROCESS_TRACE_MODE_RAW_TIMESTAMP – Timestamps in the EVENT_RECORD provided to the EventCallback will not be converted to file time as they are by default. Instead, they will remain in the clock type of the original event (e.g. QueryPerformanceCounter, CPU timestamp counter, or GetSystemTimeAsFileTime).
     */
    ProcessTraceModes : ETW_PROCESS_TRACE_MODES

    /**
     * Function pointer of type [PEVENT_RECORD_CALLBACK](nc-evntrace-pevent_record_callback.md). Called for each event in time order. If NULL then all event playback processing will be bypassed for improved performance.
     */
    EventCallback : IntPtr

    /**
     * User defined context that will be available in EVENT_RECORD.UserContext inside the EventCallback.
     */
    EventCallbackContext : IntPtr

    /**
     * Called for each buffer once processing on that buffer is complete. If NULL then no buffer callback will be executed.
     */
    BufferCallback : IntPtr

    /**
     * User defined context that will be passed to the [BufferCallback](nc-evntrace-petw_buffer_callback.md) as the CallbackContext parameter.
     */
    BufferCallbackContext : IntPtr

}
