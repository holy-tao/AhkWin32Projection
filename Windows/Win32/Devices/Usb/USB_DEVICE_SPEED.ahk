#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USB_DEVICE_SPEED extends Win32Enum {

    /**
     * Native name: UsbLowSpeed
     * @type {Integer (Int32)}
     */
    static LowSpeed => 0

    /**
     * Native name: UsbFullSpeed
     * @type {Integer (Int32)}
     */
    static FullSpeed => 1

    /**
     * Native name: UsbHighSpeed
     * @type {Integer (Int32)}
     */
    static HighSpeed => 2

    /**
     * Native name: UsbSuperSpeed
     * @type {Integer (Int32)}
     */
    static SuperSpeed => 3
}
