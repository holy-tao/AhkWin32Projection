#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TEXT_STORE_TEXT_CHANGE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static TS_ST_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TS_ST_CORRECTION => 1
}
