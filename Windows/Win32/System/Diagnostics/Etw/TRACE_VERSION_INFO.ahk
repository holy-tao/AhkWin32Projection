#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Determines the version information of the TraceLogging session.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-trace_version_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct TRACE_VERSION_INFO {
    #StructPack 4

    /**
     * The version of the trace processing API on the current system.
     */
    EtwTraceProcessingVersion : UInt32

    /**
     * Not used.
     */
    Reserved : UInt32

}
