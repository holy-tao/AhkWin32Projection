#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether to get or set the vertical or horizontal position of a monitor's display area.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_position_type
 * @namespace Windows.Win32.Devices.Display
 */
class MC_POSITION_TYPE extends Win32Enum {

    /**
     * Horizontal position.
     * Native name: MC_HORIZONTAL_POSITION
     * @type {Integer (Int32)}
     */
    static HORIZONTAL_POSITION => 0

    /**
     * Vertical position.
     * Native name: MC_VERTICAL_POSITION
     * @type {Integer (Int32)}
     */
    static VERTICAL_POSITION => 1
}
