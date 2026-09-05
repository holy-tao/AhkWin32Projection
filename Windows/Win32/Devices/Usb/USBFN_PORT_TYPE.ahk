#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USBFN_PORT_TYPE extends Win32Enum {

    /**
     * Native name: UsbfnUnknownPort
     * @type {Integer (Int32)}
     */
    static UnknownPort => 0

    /**
     * Native name: UsbfnStandardDownstreamPort
     * @type {Integer (Int32)}
     */
    static StandardDownstreamPort => 1

    /**
     * Native name: UsbfnChargingDownstreamPort
     * @type {Integer (Int32)}
     */
    static ChargingDownstreamPort => 2

    /**
     * Native name: UsbfnDedicatedChargingPort
     * @type {Integer (Int32)}
     */
    static DedicatedChargingPort => 3

    /**
     * Native name: UsbfnInvalidDedicatedChargingPort
     * @type {Integer (Int32)}
     */
    static InvalidDedicatedChargingPort => 4

    /**
     * Native name: UsbfnProprietaryDedicatedChargingPort
     * @type {Integer (Int32)}
     */
    static ProprietaryDedicatedChargingPort => 5

    /**
     * Native name: UsbfnPortTypeMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 6
}
