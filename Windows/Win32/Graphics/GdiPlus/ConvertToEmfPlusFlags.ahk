#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ConvertToEmfPlusFlags extends Win32Enum {

    /**
     * Native name: ConvertToEmfPlusFlagsDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: ConvertToEmfPlusFlagsRopUsed
     * @type {Integer (Int32)}
     */
    static RopUsed => 1

    /**
     * Native name: ConvertToEmfPlusFlagsText
     * @type {Integer (Int32)}
     */
    static Text => 2

    /**
     * Native name: ConvertToEmfPlusFlagsInvalidRecord
     * @type {Integer (Int32)}
     */
    static InvalidRecord => 4
}
