#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class HYPERLINKSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static HLS_NORMALTEXT => 1

    /**
     * @type {Integer (Int32)}
     */
    static HLS_LINKTEXT => 2
}
