#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USBFN_DIRECTION extends Win32Enum {

    /**
     * Native name: UsbfnDirectionMinimum
     * @type {Integer (Int32)}
     */
    static Minimum => 0

    /**
     * Native name: UsbfnDirectionIn
     * @type {Integer (Int32)}
     */
    static In => 1

    /**
     * Native name: UsbfnDirectionOut
     * @type {Integer (Int32)}
     */
    static Out => 2

    /**
     * Native name: UsbfnDirectionTx
     * @type {Integer (Int32)}
     */
    static Tx => 1

    /**
     * Native name: UsbfnDirectionRx
     * @type {Integer (Int32)}
     */
    static Rx => 2

    /**
     * Native name: UsbfnDirectionMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 3
}
