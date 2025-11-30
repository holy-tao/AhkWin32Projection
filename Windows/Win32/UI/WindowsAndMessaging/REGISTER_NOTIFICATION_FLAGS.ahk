#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class REGISTER_NOTIFICATION_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_NOTIFY_SERVICE_HANDLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_NOTIFY_CALLBACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_NOTIFY_WINDOW_HANDLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_NOTIFY_ALL_INTERFACE_CLASSES => 4
}
