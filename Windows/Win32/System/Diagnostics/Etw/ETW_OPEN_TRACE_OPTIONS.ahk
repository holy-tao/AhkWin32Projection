#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Provides configuration parameters to OpenTraceFromBufferStream, OpenTraceFromFile, OpenTraceFromRealTimeLogger, OpenTraceFromRealTimeLoggerWithAllocationOptions functions.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-etw_open_trace_options
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ETW_OPEN_TRACE_OPTIONS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A bitfield enum providing further configurations for the processing sessions. Current supported values:
     * 
     * - ETW_PROCESS_TRACE_MODE_NONE
     * - ETW_PROCESS_TRACE_MODE_RAW_TIMESTAMP – Timestamps in the EVENT_RECORD provided to the EventCallback will not be converted to file time as they are by default. Instead, they will remain in the clock type of the original event (e.g. QueryPerformanceCounter, CPU timestamp counter, or GetSystemTimeAsFileTime).
     * @type {Integer}
     */
    ProcessTraceModes {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Function pointer of type [PEVENT_RECORD_CALLBACK](nc-evntrace-pevent_record_callback.md). Called for each event in time order. If NULL then all event playback processing will be bypassed for improved performance.
     * @type {Pointer<Ptr>}
     */
    EventCallback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * User defined context that will be available in EVENT_RECORD.UserContext inside the EventCallback.
     * @type {Pointer<Void>}
     */
    EventCallbackContext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Called for each buffer once processing on that buffer is complete. If NULL then no buffer callback will be executed.
     * @type {Pointer<Ptr>}
     */
    BufferCallback {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * User defined context that will be passed to the [BufferCallback](nc-evntrace-petw_buffer_callback.md) as the CallbackContext parameter.
     * @type {Pointer<Void>}
     */
    BufferCallbackContext {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
