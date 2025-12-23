#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class LEGACY_TOUCHPAD_FEATURES extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static LEGACY_TOUCHPAD_FEATURE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static LEGACY_TOUCHPAD_FEATURE_ENABLE_DISABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static LEGACY_TOUCHPAD_FEATURE_REVERSE_SCROLL_DIRECTION => 4
}
