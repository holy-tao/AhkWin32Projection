#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Magnification
 * @version v4.0.30319
 */
class MW_FILTERMODE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MW_FILTERMODE_EXCLUDE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MW_FILTERMODE_INCLUDE => 1
}
