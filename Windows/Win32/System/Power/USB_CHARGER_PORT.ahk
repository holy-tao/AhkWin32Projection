#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class USB_CHARGER_PORT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UsbChargerPort_Legacy => 0

    /**
     * @type {Integer (Int32)}
     */
    static UsbChargerPort_TypeC => 1

    /**
     * @type {Integer (Int32)}
     */
    static UsbChargerPort_Max => 2
}
