#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class SF_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SF_ERROR => 10

    /**
     * @type {Integer (Int32)}
     */
    static SF_I1 => 16

    /**
     * @type {Integer (Int32)}
     */
    static SF_I2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static SF_I4 => 3

    /**
     * @type {Integer (Int32)}
     */
    static SF_I8 => 20

    /**
     * @type {Integer (Int32)}
     */
    static SF_BSTR => 8

    /**
     * @type {Integer (Int32)}
     */
    static SF_UNKNOWN => 13

    /**
     * @type {Integer (Int32)}
     */
    static SF_DISPATCH => 9

    /**
     * @type {Integer (Int32)}
     */
    static SF_VARIANT => 12

    /**
     * @type {Integer (Int32)}
     */
    static SF_RECORD => 36

    /**
     * @type {Integer (Int32)}
     */
    static SF_HAVEIID => 32781
}
