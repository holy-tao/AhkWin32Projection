#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class EVENT_TRACE_CONTROL extends Win32Enum {

    /**
     * Native name: EVENT_TRACE_CONTROL_FLUSH
     * @type {Integer (UInt32)}
     */
    static FLUSH => 3

    /**
     * Native name: EVENT_TRACE_CONTROL_QUERY
     * @type {Integer (UInt32)}
     */
    static QUERY => 0

    /**
     * Native name: EVENT_TRACE_CONTROL_STOP
     * @type {Integer (UInt32)}
     */
    static STOP => 1

    /**
     * Native name: EVENT_TRACE_CONTROL_UPDATE
     * @type {Integer (UInt32)}
     */
    static UPDATE => 2
}
