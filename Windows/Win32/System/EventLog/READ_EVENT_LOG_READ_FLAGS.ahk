#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class READ_EVENT_LOG_READ_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static EVENTLOG_SEEK_READ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVENTLOG_SEQUENTIAL_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENTLOG_FORWARDS_READ => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EVENTLOG_BACKWARDS_READ => 8
}
