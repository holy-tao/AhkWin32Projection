#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LIST_VIEW_GROUP_STATE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_COLLAPSED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_HIDDEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_NOHEADER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_COLLAPSIBLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_FOCUSED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_SELECTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_SUBSETED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_SUBSETLINKFOCUSED => 128
}
