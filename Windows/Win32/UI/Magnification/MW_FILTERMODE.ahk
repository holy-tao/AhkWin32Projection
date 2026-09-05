#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Magnification
 */
class MW_FILTERMODE extends Win32Enum {

    /**
     * Native name: MW_FILTERMODE_EXCLUDE
     * @type {Integer (UInt32)}
     */
    static EXCLUDE => 0

    /**
     * Native name: MW_FILTERMODE_INCLUDE
     * @type {Integer (UInt32)}
     */
    static INCLUDE => 1
}
