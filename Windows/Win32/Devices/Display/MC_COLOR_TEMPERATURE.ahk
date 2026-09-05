#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes a monitor's color temperature.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_color_temperature
 * @namespace Windows.Win32.Devices.Display
 */
class MC_COLOR_TEMPERATURE extends Win32Enum {

    /**
     * Unknown temperature.
     * Native name: MC_COLOR_TEMPERATURE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * 4,000 kelvins (K).
     * Native name: MC_COLOR_TEMPERATURE_4000K
     * @type {Integer (Int32)}
     */
    static 4000K => 1

    /**
     * 5,000 K.
     * Native name: MC_COLOR_TEMPERATURE_5000K
     * @type {Integer (Int32)}
     */
    static 5000K => 2

    /**
     * 6,500 K.
     * Native name: MC_COLOR_TEMPERATURE_6500K
     * @type {Integer (Int32)}
     */
    static 6500K => 3

    /**
     * 7,500 K.
     * Native name: MC_COLOR_TEMPERATURE_7500K
     * @type {Integer (Int32)}
     */
    static 7500K => 4

    /**
     * 8,200 K.
     * Native name: MC_COLOR_TEMPERATURE_8200K
     * @type {Integer (Int32)}
     */
    static 8200K => 5

    /**
     * 9,300 K
     * Native name: MC_COLOR_TEMPERATURE_9300K
     * @type {Integer (Int32)}
     */
    static 9300K => 6

    /**
     * 10,000 K.
     * Native name: MC_COLOR_TEMPERATURE_10000K
     * @type {Integer (Int32)}
     */
    static 10000K => 7

    /**
     * 11,500 K.
     * Native name: MC_COLOR_TEMPERATURE_11500K
     * @type {Integer (Int32)}
     */
    static 11500K => 8
}
