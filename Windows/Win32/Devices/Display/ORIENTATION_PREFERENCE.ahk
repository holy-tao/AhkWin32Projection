#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the screen orientation preference for a desktop app process.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-orientation_preference
 * @namespace Windows.Win32.Devices.Display
 */
class ORIENTATION_PREFERENCE extends Win32BitflagEnum {

    /**
     * The process has no device orientation preferences. The system may choose any available setting.
     * Native name: ORIENTATION_PREFERENCE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The process represents a desktop app that can be used in landscape mode.
     * Native name: ORIENTATION_PREFERENCE_LANDSCAPE
     * @type {Integer (Int32)}
     */
    static LANDSCAPE => 1

    /**
     * The process represents a desktop app that can be used in portrait mode.
     * Native name: ORIENTATION_PREFERENCE_PORTRAIT
     * @type {Integer (Int32)}
     */
    static PORTRAIT => 2

    /**
     * The process represents a desktop app that can be used in flipped landscape mode.
     * Native name: ORIENTATION_PREFERENCE_LANDSCAPE_FLIPPED
     * @type {Integer (Int32)}
     */
    static LANDSCAPE_FLIPPED => 4

    /**
     * The process represents a desktop app that can be used in flipped portrait mode.
     * Native name: ORIENTATION_PREFERENCE_PORTRAIT_FLIPPED
     * @type {Integer (Int32)}
     */
    static PORTRAIT_FLIPPED => 8
}
