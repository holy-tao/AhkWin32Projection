#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether to get or set a monitor's red, green, or blue gain.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_gain_type
 * @namespace Windows.Win32.Devices.Display
 */
class MC_GAIN_TYPE extends Win32Enum {

    /**
     * Red gain.
     * Native name: MC_RED_GAIN
     * @type {Integer (Int32)}
     */
    static RED_GAIN => 0

    /**
     * Green gain.
     * Native name: MC_GREEN_GAIN
     * @type {Integer (Int32)}
     */
    static GREEN_GAIN => 1

    /**
     * Blue gain.
     * Native name: MC_BLUE_GAIN
     * @type {Integer (Int32)}
     */
    static BLUE_GAIN => 2
}
