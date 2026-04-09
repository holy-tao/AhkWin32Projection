#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class NMLVGETINFOTIP_FLAGS extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static LVGIT_UNFOLDED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVGIT_ZERO => 0
}
