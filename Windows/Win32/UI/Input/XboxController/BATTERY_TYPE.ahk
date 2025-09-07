#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 * @version v4.0.30319
 */
class BATTERY_TYPE{

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_TYPE_DISCONNECTED => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_TYPE_WIRED => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_TYPE_ALKALINE => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_TYPE_NIMH => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_TYPE_UNKNOWN => 0xFF
}
