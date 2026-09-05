#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class USB_CHARGER_PORT extends Win32Enum {

    /**
     * Native name: UsbChargerPort_Legacy
     * @type {Integer (Int32)}
     */
    static Legacy => 0

    /**
     * Native name: UsbChargerPort_TypeC
     * @type {Integer (Int32)}
     */
    static TypeC => 1

    /**
     * Native name: UsbChargerPort_Max
     * @type {Integer (Int32)}
     */
    static Max => 2
}
