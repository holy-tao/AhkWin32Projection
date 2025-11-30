#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible types of data that the subscription service can deliver to your callback.
 * @see https://docs.microsoft.com/windows/win32/api//winevt/ne-winevt-evt_subscribe_notify_action
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_SUBSCRIBE_NOTIFY_ACTION extends Win32Enum{

    /**
     * Indicates that the <i>Event</i> parameter contains a Win32 error code.
     * @type {Integer (Int32)}
     */
    static EvtSubscribeActionError => 0

    /**
     * Indicates that the <i>Event</i> parameter contains an event that matches the subscriber's query.
     * @type {Integer (Int32)}
     */
    static EvtSubscribeActionDeliver => 1
}
