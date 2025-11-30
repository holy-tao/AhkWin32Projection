#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether to get or set a monitor's red, green, or blue gain.
 * @see https://docs.microsoft.com/windows/win32/api//highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_gain_type
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class MC_GAIN_TYPE extends Win32Enum{

    /**
     * Red gain.
     * @type {Integer (Int32)}
     */
    static MC_RED_GAIN => 0

    /**
     * Green gain.
     * @type {Integer (Int32)}
     */
    static MC_GREEN_GAIN => 1

    /**
     * Blue gain.
     * @type {Integer (Int32)}
     */
    static MC_BLUE_GAIN => 2
}
