#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USB_HUB_TYPE extends Win32Enum {

    /**
     * Native name: UsbRootHub
     * @type {Integer (Int32)}
     */
    static RootHub => 1

    /**
     * @type {Integer (Int32)}
     */
    static Usb20Hub => 2

    /**
     * @type {Integer (Int32)}
     */
    static Usb30Hub => 3
}
