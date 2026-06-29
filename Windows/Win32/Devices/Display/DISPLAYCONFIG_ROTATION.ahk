#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DISPLAYCONFIG_ROTATION enumeration specifies the clockwise rotation of the display.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ne-wingdi-displayconfig_rotation
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_ROTATION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
