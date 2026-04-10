#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class LOGOFFBUTTONSSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SPLS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPLS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPLS_PRESSED => 3
}
