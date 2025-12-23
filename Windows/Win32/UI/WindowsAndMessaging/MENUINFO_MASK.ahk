#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MENUINFO_MASK extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static MIM_APPLYTOSUBMENUS => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static MIM_BACKGROUND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MIM_HELPID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MIM_MAXHEIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MIM_MENUDATA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MIM_STYLE => 16
}
