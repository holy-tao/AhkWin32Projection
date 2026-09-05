#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IO_CONTAINER_NOTIFICATION_CLASS extends Win32Enum {

    /**
     * Native name: IoSessionStateNotification
     * @type {Integer (Int32)}
     */
    static SessionStateNotification => 0

    /**
     * Native name: IoMaxContainerNotificationClass
     * @type {Integer (Int32)}
     */
    static MaxContainerNotificationClass => 1
}
