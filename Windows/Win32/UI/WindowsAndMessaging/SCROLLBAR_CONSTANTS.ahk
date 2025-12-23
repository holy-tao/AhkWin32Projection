#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class SCROLLBAR_CONSTANTS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static SB_CTL => 2

    /**
     * @type {Integer (Int32)}
     */
    static SB_HORZ => 0

    /**
     * @type {Integer (Int32)}
     */
    static SB_VERT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SB_BOTH => 3
}
