#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CALL_NOTIFICATION_EVENT enum describes call notification events. The ITCallNotificationEvent::get_Event method returns a member of this enum to indicate the type of call notification event that occurred.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-call_notification_event
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class CALL_NOTIFICATION_EVENT extends Win32Enum{

    /**
     * The current application owns the call on which the event occurred.
     * @type {Integer (Int32)}
     */
    static CNE_OWNER => 0

    /**
     * The current application is monitoring the call on which the event occurred.
     * @type {Integer (Int32)}
     */
    static CNE_MONITOR => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CNE_LASTITEM => 1
}
