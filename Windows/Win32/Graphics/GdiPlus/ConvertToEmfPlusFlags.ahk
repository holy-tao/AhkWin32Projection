#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ConvertToEmfPlusFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ConvertToEmfPlusFlagsDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static ConvertToEmfPlusFlagsRopUsed => 1

    /**
     * @type {Integer (Int32)}
     */
    static ConvertToEmfPlusFlagsText => 2

    /**
     * @type {Integer (Int32)}
     */
    static ConvertToEmfPlusFlagsInvalidRecord => 4
}
