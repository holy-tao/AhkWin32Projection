#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USB_WMI_DEVICE_NODE_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static UsbDevice => 0

    /**
     * @type {Integer (Int32)}
     */
    static HubDevice => 1

    /**
     * @type {Integer (Int32)}
     */
    static CompositeDevice => 2

    /**
     * @type {Integer (Int32)}
     */
    static UsbController => 3
}
