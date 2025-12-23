#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBFN_DIRECTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDirectionMinimum => 0

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDirectionIn => 1

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDirectionOut => 2

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDirectionTx => 1

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDirectionRx => 2

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDirectionMaximum => 3
}
