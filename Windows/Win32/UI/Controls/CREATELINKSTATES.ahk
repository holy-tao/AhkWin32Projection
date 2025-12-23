#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class CREATELINKSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DDCREATELINK_HIGHLIGHT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDCREATELINK_NOHIGHLIGHT => 2
}
