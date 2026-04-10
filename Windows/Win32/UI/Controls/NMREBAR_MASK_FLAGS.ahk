#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class NMREBAR_MASK_FLAGS extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static RBNM_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RBNM_LPARAM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RBNM_STYLE => 2
}
