#Requires AutoHotkey v2.0.0 64-bit

/**
 * Deprecated. This enumeration is used by the BASEBROWSERDATA structure to indicate the base browser's lock icon status.
 * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/ne-shdeprecated-securelockcode
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SECURELOCKCODE{

    /**
     * No change in security encryption status.
     * @type {Integer (Int32)}
     */
    static SECURELOCK_NOCHANGE => -1

    /**
     * There is no security encryption present.
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SET_UNSECURE => 0

    /**
     * There are multiple security encryption methods present.
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SET_MIXED => 1

    /**
     * The security encryption level is not known.
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SET_SECUREUNKNOWNBIT => 2

    /**
     * There is 40-bit security encryption present.
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SET_SECURE40BIT => 3

    /**
     * There is 56-bit security encryption present.
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SET_SECURE56BIT => 4

    /**
     * There is Fortezza security encryption present.
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SET_FORTEZZA => 5

    /**
     * There is 128-bit security encryption present.
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SET_SECURE128BIT => 6

    /**
     * Suggest a security encryption setting.
     * @type {Integer (Int32)}
     */
    static SECURELOCK_FIRSTSUGGEST => 7

    /**
     * No security encryption has been suggested.
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SUGGEST_UNSECURE => 7

    /**
     * Mixed security encryption methods have been suggested.
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SUGGEST_MIXED => 8

    /**
     * An unknown security encryption method has been suggested.
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SUGGEST_SECUREUNKNOWNBIT => 9

    /**
     * A 40-bit security encryption has been suggested.
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SUGGEST_SECURE40BIT => 10

    /**
     * A 56-bit security encryption has been suggested.
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SUGGEST_SECURE56BIT => 11

    /**
     * A Fortezza security encryption has been suggested.
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SUGGEST_FORTEZZA => 12

    /**
     * A 128-bit security encryption has been suggested.
     * @type {Integer (Int32)}
     */
    static SECURELOCK_SUGGEST_SECURE128BIT => 13
}
