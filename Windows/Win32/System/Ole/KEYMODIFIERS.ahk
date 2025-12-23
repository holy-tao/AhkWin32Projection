#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class KEYMODIFIERS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static KEYMOD_SHIFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KEYMOD_CONTROL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KEYMOD_ALT => 4
}
