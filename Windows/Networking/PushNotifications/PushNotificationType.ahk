#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The type of push notification that has been received from the app server. Used by the [NotificationType](pushnotificationreceivedeventargs_notificationtype.md) property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationtype
 * @namespace Windows.Networking.PushNotifications
 * @version WindowsRuntime 1.4
 */
class PushNotificationType extends Win32Enum{

    /**
     * A push notification to display as toast.
     * @type {Integer (Int32)}
     */
    static Toast => 0

    /**
     * A push notification to update one or more elements of a tile.
     * @type {Integer (Int32)}
     */
    static Tile => 1

    /**
     * A push notification to update a tile's badge overlay.
     * @type {Integer (Int32)}
     */
    static Badge => 2

    /**
     * A push notification to perform an update to a tile that does not involve UI.
     * @type {Integer (Int32)}
     */
    static Raw => 3

    /**
     * A push notification to update an app's tile flyout.
     * @type {Integer (Int32)}
     */
    static TileFlyout => 4
}
