#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UNumberRangeIdentityResult extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_IDENTITY_RESULT_EQUAL_BEFORE_ROUNDING => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_IDENTITY_RESULT_EQUAL_AFTER_ROUNDING => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_IDENTITY_RESULT_NOT_EQUAL => 2
}
