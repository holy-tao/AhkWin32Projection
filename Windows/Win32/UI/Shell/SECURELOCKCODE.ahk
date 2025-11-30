#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/ne-shdeprecated-securelockcode
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SECURELOCKCODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SECURELOCK_NOCHANGE => -1

    /**
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SET_UNSECURE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SET_MIXED => 1

    /**
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SET_SECUREUNKNOWNBIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SET_SECURE40BIT => 3

    /**
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SET_SECURE56BIT => 4

    /**
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SET_FORTEZZA => 5

    /**
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SET_SECURE128BIT => 6

    /**
     * @type {Integer (Int32)}
     */
    static SECURELOCK_FIRSTSUGGEST => 7

    /**
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SUGGEST_UNSECURE => 7

    /**
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SUGGEST_MIXED => 8

    /**
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SUGGEST_SECUREUNKNOWNBIT => 9

    /**
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SUGGEST_SECURE40BIT => 10

    /**
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SUGGEST_SECURE56BIT => 11

    /**
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SUGGEST_FORTEZZA => 12

    /**
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SUGGEST_SECURE128BIT => 13
}
