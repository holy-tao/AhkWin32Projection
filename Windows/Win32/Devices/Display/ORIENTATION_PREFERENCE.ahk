#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the screen orientation preference for a desktop app process.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-orientation_preference
 * @namespace Windows.Win32.Devices.Display
 */
export default struct ORIENTATION_PREFERENCE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The process has no device orientation preferences. The system may choose any available setting.
     * @type {Integer (Int32)}
     */
    static ORIENTATION_PREFERENCE_NONE => 0

    /**
     * The process represents a desktop app that can be used in landscape mode.
     * @type {Integer (Int32)}
     */
    static ORIENTATION_PREFERENCE_LANDSCAPE => 1

    /**
     * The process represents a desktop app that can be used in portrait mode.
     * @type {Integer (Int32)}
     */
    static ORIENTATION_PREFERENCE_PORTRAIT => 2

    /**
     * The process represents a desktop app that can be used in flipped landscape mode.
     * @type {Integer (Int32)}
     */
    static ORIENTATION_PREFERENCE_LANDSCAPE_FLIPPED => 4

    /**
     * The process represents a desktop app that can be used in flipped portrait mode.
     * @type {Integer (Int32)}
     */
    static ORIENTATION_PREFERENCE_PORTRAIT_FLIPPED => 8
}
