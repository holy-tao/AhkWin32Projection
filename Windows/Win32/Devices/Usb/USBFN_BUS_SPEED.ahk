#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USBFN_BUS_SPEED extends Win32Enum {

    /**
     * Native name: UsbfnBusSpeedLow
     * @type {Integer (Int32)}
     */
    static Low => 0

    /**
     * Native name: UsbfnBusSpeedFull
     * @type {Integer (Int32)}
     */
    static Full => 1

    /**
     * Native name: UsbfnBusSpeedHigh
     * @type {Integer (Int32)}
     */
    static High => 2

    /**
     * Native name: UsbfnBusSpeedSuper
     * @type {Integer (Int32)}
     */
    static Super => 3

    /**
     * Native name: UsbfnBusSpeedMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 4
}
