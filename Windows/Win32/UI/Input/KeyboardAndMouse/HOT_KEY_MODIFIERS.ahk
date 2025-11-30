#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class HOT_KEY_MODIFIERS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_ALT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_CONTROL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_NOREPEAT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_SHIFT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MOD_WIN => 8
}
