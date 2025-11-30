#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ETW_PROCESS_TRACE_MODES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ETW_PROCESS_TRACE_MODE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ETW_PROCESS_TRACE_MODE_RAW_TIMESTAMP => 1
}
