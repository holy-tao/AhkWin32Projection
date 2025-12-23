#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBFN_PORT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnUnknownPort => 0

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnStandardDownstreamPort => 1

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnChargingDownstreamPort => 2

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDedicatedChargingPort => 3

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnInvalidDedicatedChargingPort => 4

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnProprietaryDedicatedChargingPort => 5

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnPortTypeMaximum => 6
}
