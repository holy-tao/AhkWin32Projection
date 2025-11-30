#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TA_PROPERTY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TAP_FLAGS => 0

    /**
     * @type {Integer (Int32)}
     */
    static TAP_TRANSFORMCOUNT => 1

    /**
     * @type {Integer (Int32)}
     */
    static TAP_STAGGERDELAY => 2

    /**
     * @type {Integer (Int32)}
     */
    static TAP_STAGGERDELAYCAP => 3

    /**
     * @type {Integer (Int32)}
     */
    static TAP_STAGGERDELAYFACTOR => 4

    /**
     * @type {Integer (Int32)}
     */
    static TAP_ZORDER => 5
}
