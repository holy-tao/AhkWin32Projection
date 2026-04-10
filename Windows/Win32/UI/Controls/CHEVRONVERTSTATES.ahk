#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class CHEVRONVERTSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static CHEVSV_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static CHEVSV_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static CHEVSV_PRESSED => 3
}
