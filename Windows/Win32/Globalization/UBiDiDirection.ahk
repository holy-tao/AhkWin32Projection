#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UBiDiDirection extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_LTR => 0

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_RTL => 1

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_MIXED => 2

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_NEUTRAL => 3
}
