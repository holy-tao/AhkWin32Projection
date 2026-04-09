#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USB_HUB_NODE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static UsbHub => 0

    /**
     * @type {Integer (Int32)}
     */
    static UsbMIParent => 1
}
