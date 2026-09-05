#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.EventNotificationService
 */
class SENS_CONNECTION_TYPE extends Win32Enum {

    /**
     * Native name: CONNECTION_LAN
     * @type {Integer (UInt32)}
     */
    static LAN => 0

    /**
     * Native name: CONNECTION_WAN
     * @type {Integer (UInt32)}
     */
    static WAN => 1
}
