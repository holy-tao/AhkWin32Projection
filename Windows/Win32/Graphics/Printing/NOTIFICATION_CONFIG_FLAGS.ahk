#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class NOTIFICATION_CONFIG_FLAGS extends Win32Enum {

    /**
     * Native name: NOTIFICATION_CONFIG_CREATE_EVENT
     * @type {Integer (Int32)}
     */
    static CREATE_EVENT => 1

    /**
     * Native name: NOTIFICATION_CONFIG_REGISTER_CALLBACK
     * @type {Integer (Int32)}
     */
    static REGISTER_CALLBACK => 2

    /**
     * Native name: NOTIFICATION_CONFIG_EVENT_TRIGGER
     * @type {Integer (Int32)}
     */
    static EVENT_TRIGGER => 4

    /**
     * Native name: NOTIFICATION_CONFIG_ASYNC_CHANNEL
     * @type {Integer (Int32)}
     */
    static ASYNC_CHANNEL => 8
}
