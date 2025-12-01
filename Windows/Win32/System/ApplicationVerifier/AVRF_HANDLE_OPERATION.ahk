#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AVRF_BACKTRACE_INFORMATION.ahk

/**
 * Contains information required to collect handle trace information.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/ns-avrfsdk-avrf_handle_operation
 * @namespace Windows.Win32.System.ApplicationVerifier
 * @version v4.0.30319
 */
class AVRF_HANDLE_OPERATION extends Win32Struct
{
    static sizeof => 288

    static packingSize => 8

    /**
     * The handle to the heap in which handle traces are being enumerated.
     * @type {Integer}
     */
    Handle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A unique identifier associated with the process in which the application is running.
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A unique identifier of the thread (returned by the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentthreadid">GetCurrentThreadId</a> function) that has performed an operation on the given handle.
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * One of the constants in the <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ne-avrfsdk-ehandle_trace_operations">eHANDLE_TRACE_OPERATIONS</a> enum that indicate whether the handle operation is                  an open(create), close, or invalid.
     * @type {Integer}
     */
    OperationType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The alignment of the structure on a natural boundary even if the user has changed the size of the original structure.
     * @type {Integer}
     */
    Spare0 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ns-avrfsdk-avrf_backtrace_information">AVRF_BACKTRACE_INFORMATION</a> structure containing information required for completing the enumeration of handles.
     * @type {AVRF_BACKTRACE_INFORMATION}
     */
    BackTraceInformation{
        get {
            if(!this.HasProp("__BackTraceInformation"))
                this.__BackTraceInformation := AVRF_BACKTRACE_INFORMATION(24, this)
            return this.__BackTraceInformation
        }
    }
}
