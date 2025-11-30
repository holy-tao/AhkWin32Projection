#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UNumberFormatPadPosition extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_PAD_BEFORE_PREFIX => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_PAD_AFTER_PREFIX => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_PAD_BEFORE_SUFFIX => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_PAD_AFTER_SUFFIX => 3
}
