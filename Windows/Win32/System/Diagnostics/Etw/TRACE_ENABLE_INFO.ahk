#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the session and the information that the session used to enable the provider.
 * @remarks
 * The
 * [TRACE_PROVIDER_INSTANCE_INFO](/windows/win32/api/evntrace/ns-evntrace-trace_provider_instance_info)
 * block contains one or more of these structures.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-trace_enable_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct TRACE_ENABLE_INFO {
    #StructPack 8

    /**
     * Indicates if the provider is enabled to the session. The value is **TRUE** if
     * the provider is enabled to the session, otherwise, the value is **FALSE**. This
     * value should always be **TRUE**.
     */
    IsEnabled : UInt32

    /**
     * Level of detail that the session asked the provider to include in the events.
     * For details, see the _Level_ parameter of the
     * [EnableTraceEx](/windows/desktop/ETW/enabletraceex-func) function.
     */
    Level : Int8

    /**
     * Reserved.
     */
    Reserved1 : Int8

    /**
     * Identifies the session that enabled the provider.
     */
    LoggerId : UInt16

    /**
     * Additional information that the session wants ETW to include in the log file.
     * For details, see the _EnableProperty_ parameter of the
     * [EnableTraceEx](/windows/desktop/ETW/enabletraceex-func) function.
     */
    EnableProperty : UInt32

    /**
     * Reserved.
     */
    Reserved2 : UInt32

    /**
     * Keywords specify which events the session wants the provider to write. For
     * details, see the _MatchAnyKeyword_ parameter of the
     * [EnableTraceEx](/windows/desktop/ETW/enabletraceex-func) function.
     */
    MatchAnyKeyword : Int64

    /**
     * Keywords specify which events the session wants the provider to write. For
     * details, see the _MatchAllKeyword_ parameter of the
     * [EnableTraceEx](/windows/desktop/ETW/enabletraceex-func) function.
     */
    MatchAllKeyword : Int64

}
