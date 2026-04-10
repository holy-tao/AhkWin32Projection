#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class TILE_WINDOWS_HOW extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static MDITILE_HORIZONTAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDITILE_VERTICAL => 0
}
