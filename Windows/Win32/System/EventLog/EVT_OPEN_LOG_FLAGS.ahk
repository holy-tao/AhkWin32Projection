#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the values that specify whether to open a channel or exported log file.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_open_log_flags
 * @namespace Windows.Win32.System.EventLog
 */
class EVT_OPEN_LOG_FLAGS extends Win32Enum {

    /**
     * Open a channel.
     * Native name: EvtOpenChannelPath
     * @type {Integer (UInt32)}
     */
    static ChannelPath => 1

    /**
     * Open an exported log file.
     * Native name: EvtOpenFilePath
     * @type {Integer (UInt32)}
     */
    static FilePath => 2
}
