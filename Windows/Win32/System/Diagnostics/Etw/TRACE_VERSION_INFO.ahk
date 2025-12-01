#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Determines the version information of the TraceLogging session.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-trace_version_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TRACE_VERSION_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The version of the trace processing API on the current system.
     * @type {Integer}
     */
    EtwTraceProcessingVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
