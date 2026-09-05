#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the default access permissions to apply to the channel.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_channel_isolation_type
 * @namespace Windows.Win32.System.EventLog
 */
class EVT_CHANNEL_ISOLATION_TYPE extends Win32Enum {

    /**
     * Provides open access to the channel.
     * Native name: EvtChannelIsolationTypeApplication
     * @type {Integer (Int32)}
     */
    static Application => 0

    /**
     * Provides restricted access to the channel and is used by applications running under system service accounts, drivers, or an application that logs events that relate to the health of the computer.
     * Native name: EvtChannelIsolationTypeSystem
     * @type {Integer (Int32)}
     */
    static System => 1

    /**
     * Provides custom access to the channel.
     * Native name: EvtChannelIsolationTypeCustom
     * @type {Integer (Int32)}
     */
    static Custom => 2
}
