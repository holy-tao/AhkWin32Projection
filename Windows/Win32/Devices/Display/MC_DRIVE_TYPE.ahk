#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether to set or get a monitor's red, green, or blue drive.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_drive_type
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class MC_DRIVE_TYPE{

    /**
     * Red drive.
     * @type {Integer (Int32)}
     */
    static MC_RED_DRIVE => 0

    /**
     * Green drive.
     * @type {Integer (Int32)}
     */
    static MC_GREEN_DRIVE => 1

    /**
     * Blue drive.
     * @type {Integer (Int32)}
     */
    static MC_BLUE_DRIVE => 2
}
