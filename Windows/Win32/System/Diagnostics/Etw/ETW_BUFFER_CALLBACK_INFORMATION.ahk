#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TRACE_LOGFILE_HEADER.ahk" { TRACE_LOGFILE_HEADER }
#Import ".\PROCESSTRACE_HANDLE.ahk" { PROCESSTRACE_HANDLE }

/**
 * Provided to the BufferCallback as the *ConsumerInfo* parameter and provides details on the current processing session.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-etw_buffer_callback_information
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct ETW_BUFFER_CALLBACK_INFORMATION {
    #StructPack 8

    /**
     * The TraceHandle for this processing session.
     */
    TraceHandle : PROCESSTRACE_HANDLE

    /**
     * [TRACE_LOGFILE_HEADER](ns-evntrace-trace_logfile_header.md) structure containing trace processing status (previously-existing structure).
     */
    LogfileHeader : TRACE_LOGFILE_HEADER.Ptr

    /**
     * The count of how many buffers have been processed up to this point.
     */
    BuffersRead : UInt32

}
