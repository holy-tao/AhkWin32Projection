#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AVRF_BACKTRACE_INFORMATION.ahk" { AVRF_BACKTRACE_INFORMATION }

/**
 * Contains information required to collect handle trace information.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/ns-avrfsdk-avrf_handle_operation
 * @namespace Windows.Win32.System.ApplicationVerifier
 */
export default struct AVRF_HANDLE_OPERATION {
    #StructPack 8

    /**
     * The handle to the heap in which handle traces are being enumerated.
     */
    Handle : Int64

    /**
     * A unique identifier associated with the process in which the application is running.
     */
    ProcessId : UInt32

    /**
     * A unique identifier of the thread (returned by the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentthreadid">GetCurrentThreadId</a> function) that has performed an operation on the given handle.
     */
    ThreadId : UInt32

    /**
     * One of the constants in the <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ne-avrfsdk-ehandle_trace_operations">eHANDLE_TRACE_OPERATIONS</a> enum that indicate whether the handle operation is                  an open(create), close, or invalid.
     */
    OperationType : UInt32

    /**
     * The alignment of the structure on a natural boundary even if the user has changed the size of the original structure.
     */
    Spare0 : UInt32

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ns-avrfsdk-avrf_backtrace_information">AVRF_BACKTRACE_INFORMATION</a> structure containing information required for completing the enumeration of handles.
     */
    BackTraceInformation : AVRF_BACKTRACE_INFORMATION

}
