#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class GRIPPERSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static TSGS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TSGS_CENTERED => 2
}
