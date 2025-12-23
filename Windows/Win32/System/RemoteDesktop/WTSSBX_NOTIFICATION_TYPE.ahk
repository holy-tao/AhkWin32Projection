#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the type of status change that occurred on a Remote Desktop Session Host (RD Session Host) server or a user session.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_notification_type
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTSSBX_NOTIFICATION_TYPE extends Win32Enum{

    /**
     * RD Connection Broker received a Removed notification. This indicates that a user has logged off an RD Session Host server or that an RD Session Host server left a farm in RD Connection Broker.
     * @type {Integer (Int32)}
     */
    static WTSSBX_NOTIFICATION_REMOVED => 1

    /**
     * RD Connection Broker received a Changed notification. This indicates that the session state of the RD Session Host server changed or that an RD Session Host server setting, such as the IP address or the maximum session limit, changed.
     * @type {Integer (Int32)}
     */
    static WTSSBX_NOTIFICATION_CHANGED => 2

    /**
     * RD Connection Broker received  an Added notification. This indicates that a user logged into an RD Session Host server or that an RD Session Host server joined a  farm in RD Connection Broker.
     * @type {Integer (Int32)}
     */
    static WTSSBX_NOTIFICATION_ADDED => 4

    /**
     * RD Connection Broker received a Resync notification. This indicates that an RD Session Host server joined a  farm in RD Connection Broker and the new RD Session Host server is now synchronizing its session information with the RD Connection Broker server.
     * @type {Integer (Int32)}
     */
    static WTSSBX_NOTIFICATION_RESYNC => 8
}
