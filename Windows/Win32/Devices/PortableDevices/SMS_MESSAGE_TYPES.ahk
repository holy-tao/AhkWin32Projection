#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/sms-message-types
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class SMS_MESSAGE_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SMS_TEXT_MESSAGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SMS_BINARY_MESSAGE => 1
}
