#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the screen orientation preference for a desktop app process.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-orientation_preference
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class ORIENTATION_PREFERENCE extends Win32BitflagEnum{

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
