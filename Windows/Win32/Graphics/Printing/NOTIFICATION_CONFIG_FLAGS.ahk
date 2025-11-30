#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class NOTIFICATION_CONFIG_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NOTIFICATION_CONFIG_CREATE_EVENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static NOTIFICATION_CONFIG_REGISTER_CALLBACK => 2

    /**
     * @type {Integer (Int32)}
     */
    static NOTIFICATION_CONFIG_EVENT_TRIGGER => 4

    /**
     * @type {Integer (Int32)}
     */
    static NOTIFICATION_CONFIG_ASYNC_CHANNEL => 8
}
