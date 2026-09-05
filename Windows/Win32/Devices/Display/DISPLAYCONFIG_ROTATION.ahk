#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DISPLAYCONFIG_ROTATION enumeration specifies the clockwise rotation of the display.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ne-wingdi-displayconfig_rotation
 * @namespace Windows.Win32.Devices.Display
 */
class DISPLAYCONFIG_ROTATION extends Win32Enum {

    /**
     * Indicates that rotation is 0 degrees—landscape mode.
     * Native name: DISPLAYCONFIG_ROTATION_IDENTITY
     * @type {Integer (Int32)}
     */
    static IDENTITY => 1

    /**
     * Indicates that rotation is 90 degrees clockwise—portrait mode.
     * Native name: DISPLAYCONFIG_ROTATION_ROTATE90
     * @type {Integer (Int32)}
     */
    static ROTATE90 => 2

    /**
     * Indicates that rotation is 180 degrees clockwise—inverted landscape mode.
     * Native name: DISPLAYCONFIG_ROTATION_ROTATE180
     * @type {Integer (Int32)}
     */
    static ROTATE180 => 3

    /**
     * Indicates that rotation is 270 degrees clockwise—inverted portrait mode.
     * Native name: DISPLAYCONFIG_ROTATION_ROTATE270
     * @type {Integer (Int32)}
     */
    static ROTATE270 => 4
}
