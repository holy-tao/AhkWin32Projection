#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class GLYPHSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static GLPS_CLOSED => 1

    /**
     * @type {Integer (Int32)}
     */
    static GLPS_OPENED => 2
}
