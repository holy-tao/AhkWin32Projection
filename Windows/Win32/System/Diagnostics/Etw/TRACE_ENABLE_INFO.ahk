#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines the session and the information that the session used to enable the provider.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-provider-instance-info">TRACE_PROVIDER_INSTANCE_INFO</a> block contains one or more of these structures.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//evntrace/ns-evntrace-trace_enable_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TRACE_ENABLE_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Indicates if the provider is enabled to the session. The value is <b>TRUE</b> if the provider is enabled to the session, otherwise, the value is <b>FALSE</b>. This value should always be <b>TRUE</b>.
     * @type {Integer}
     */
    IsEnabled {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Level of detail that the session asked the provider to include in the events. For details, see the <i>Level</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex-func">EnableTraceEx</a> function.
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * Identifies the session that enabled the provider.
     * @type {Integer}
     */
    LoggerId {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Additional information that the session wants ETW to include in the log file. For details, see the <i>EnableProperty</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex-func">EnableTraceEx</a> function.
     * @type {Integer}
     */
    EnableProperty {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Keywords specify which events the session wants the provider to write. For details, see the <i>MatchAnyKeyword</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex-func">EnableTraceEx</a> function.
     * @type {Integer}
     */
    MatchAnyKeyword {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Keywords specify which events the session wants the provider to write. For details, see the <i>MatchAllKeyword</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex-func">EnableTraceEx</a> function.
     * @type {Integer}
     */
    MatchAllKeyword {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
