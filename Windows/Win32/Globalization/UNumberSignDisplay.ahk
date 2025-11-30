#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UNumberSignDisplay extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_AUTO => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_ALWAYS => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_NEVER => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_ACCOUNTING => 3

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_ACCOUNTING_ALWAYS => 4

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_EXCEPT_ZERO => 5

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_ACCOUNTING_EXCEPT_ZERO => 6

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_NEGATIVE => 7

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_ACCOUNTING_NEGATIVE => 8

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_COUNT => 9
}
