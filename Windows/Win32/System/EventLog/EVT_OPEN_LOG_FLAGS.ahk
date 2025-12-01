#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the values that specify whether to open a channel or exported log file.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_open_log_flags
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_OPEN_LOG_FLAGS extends Win32Enum{

    /**
     * Open a channel.
     * @type {Integer (UInt32)}
     */
    static EvtOpenChannelPath => 1

    /**
     * Open an exported log file.
     * @type {Integer (UInt32)}
     */
    static EvtOpenFilePath => 2
}
