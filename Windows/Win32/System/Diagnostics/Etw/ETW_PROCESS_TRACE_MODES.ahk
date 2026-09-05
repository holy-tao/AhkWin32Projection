#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class ETW_PROCESS_TRACE_MODES extends Win32Enum {

    /**
     * Native name: ETW_PROCESS_TRACE_MODE_NONE
     * @type {Integer (Int32)}
     */
    static MODE_NONE => 0

    /**
     * Native name: ETW_PROCESS_TRACE_MODE_RAW_TIMESTAMP
     * @type {Integer (Int32)}
     */
    static MODE_RAW_TIMESTAMP => 1
}
