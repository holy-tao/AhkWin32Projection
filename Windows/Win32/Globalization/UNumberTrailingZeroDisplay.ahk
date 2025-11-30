#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UNumberTrailingZeroDisplay extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_TRAILING_ZERO_AUTO => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_TRAILING_ZERO_HIDE_IF_WHOLE => 1
}
