#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether to get or set the vertical or horizontal position of a monitor's display area.
 * @see https://docs.microsoft.com/windows/win32/api//highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_position_type
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class MC_POSITION_TYPE{

    /**
     * Horizontal position.
     * @type {Integer (Int32)}
     */
    static MC_HORIZONTAL_POSITION => 0

    /**
     * Vertical position.
     * @type {Integer (Int32)}
     */
    static MC_VERTICAL_POSITION => 1
}
