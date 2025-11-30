#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LIST_VIEW_GROUP_ALIGN_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static LVGA_HEADER_LEFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVGA_HEADER_CENTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LVGA_HEADER_RIGHT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LVGA_FOOTER_LEFT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LVGA_FOOTER_CENTER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LVGA_FOOTER_RIGHT => 32
}
