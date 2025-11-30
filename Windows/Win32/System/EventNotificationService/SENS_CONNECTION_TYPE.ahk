#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.EventNotificationService
 * @version v4.0.30319
 */
class SENS_CONNECTION_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECTION_LAN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECTION_WAN => 1
}
