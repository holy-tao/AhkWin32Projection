#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the default access permissions to apply to the channel.
 * @see https://docs.microsoft.com/windows/win32/api//winevt/ne-winevt-evt_channel_isolation_type
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_CHANNEL_ISOLATION_TYPE extends Win32Enum{

    /**
     * Provides open access to the channel.
     * @type {Integer (Int32)}
     */
    static EvtChannelIsolationTypeApplication => 0

    /**
     * Provides restricted access to the channel and is used by applications running under system service accounts, drivers, or an application that logs events that relate to the health of the computer.
     * @type {Integer (Int32)}
     */
    static EvtChannelIsolationTypeSystem => 1

    /**
     * Provides custom access to the channel.
     * @type {Integer (Int32)}
     */
    static EvtChannelIsolationTypeCustom => 2
}
