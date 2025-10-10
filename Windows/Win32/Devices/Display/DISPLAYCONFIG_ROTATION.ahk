#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DISPLAYCONFIG_ROTATION enumeration specifies the clockwise rotation of the display.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ne-wingdi-displayconfig_rotation
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_ROTATION{

    /**
     * Indicates that rotation is 0 degrees—landscape mode.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_ROTATION_IDENTITY => 1

    /**
     * Indicates that rotation is 90 degrees clockwise—portrait mode.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_ROTATION_ROTATE90 => 2

    /**
     * Indicates that rotation is 180 degrees clockwise—inverted landscape mode.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_ROTATION_ROTATE180 => 3

    /**
     * Indicates that rotation is 270 degrees clockwise—inverted portrait mode.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_ROTATION_ROTATE270 => 4
}
