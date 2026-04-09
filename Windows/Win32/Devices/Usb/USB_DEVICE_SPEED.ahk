#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USB_DEVICE_SPEED extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static UsbLowSpeed => 0

    /**
     * @type {Integer (Int32)}
     */
    static UsbFullSpeed => 1

    /**
     * @type {Integer (Int32)}
     */
    static UsbHighSpeed => 2

    /**
     * @type {Integer (Int32)}
     */
    static UsbSuperSpeed => 3
}
