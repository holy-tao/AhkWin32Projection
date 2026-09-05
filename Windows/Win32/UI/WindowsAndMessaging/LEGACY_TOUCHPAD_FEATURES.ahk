#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class LEGACY_TOUCHPAD_FEATURES extends Win32BitflagEnum {

    /**
     * Native name: LEGACY_TOUCHPAD_FEATURE_NONE
     * @type {Integer (Int32)}
     */
    static FEATURE_NONE => 0

    /**
     * Native name: LEGACY_TOUCHPAD_FEATURE_ENABLE_DISABLE
     * @type {Integer (Int32)}
     */
    static FEATURE_ENABLE_DISABLE => 1

    /**
     * Native name: LEGACY_TOUCHPAD_FEATURE_REVERSE_SCROLL_DIRECTION
     * @type {Integer (Int32)}
     */
    static FEATURE_REVERSE_SCROLL_DIRECTION => 4
}
