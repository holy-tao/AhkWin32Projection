#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMTBDISPINFOW_MASK extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static TBNF_IMAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TBNF_TEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TBNF_DI_SETITEM => 268435456
}
