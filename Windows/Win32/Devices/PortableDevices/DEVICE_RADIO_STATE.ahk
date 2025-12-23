#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class DEVICE_RADIO_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DRS_RADIO_ON => 0

    /**
     * @type {Integer (Int32)}
     */
    static DRS_SW_RADIO_OFF => 1

    /**
     * @type {Integer (Int32)}
     */
    static DRS_HW_RADIO_OFF => 2

    /**
     * @type {Integer (Int32)}
     */
    static DRS_SW_HW_RADIO_OFF => 3

    /**
     * @type {Integer (Int32)}
     */
    static DRS_HW_RADIO_ON_UNCONTROLLABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DRS_RADIO_INVALID => 5

    /**
     * @type {Integer (Int32)}
     */
    static DRS_HW_RADIO_OFF_UNCONTROLLABLE => 6

    /**
     * @type {Integer (Int32)}
     */
    static DRS_RADIO_MAX => 6
}
