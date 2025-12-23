#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_DEVICE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Usb11Device => 0

    /**
     * @type {Integer (Int32)}
     */
    static Usb20Device => 1
}
