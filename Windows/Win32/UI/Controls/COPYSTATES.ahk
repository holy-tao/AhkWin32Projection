#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class COPYSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DDCOPY_HIGHLIGHT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDCOPY_NOHIGHLIGHT => 2
}
