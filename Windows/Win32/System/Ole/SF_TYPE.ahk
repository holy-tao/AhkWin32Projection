#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class SF_TYPE extends Win32Enum {

    /**
     * Native name: SF_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 10

    /**
     * Native name: SF_I1
     * @type {Integer (Int32)}
     */
    static I1 => 16

    /**
     * Native name: SF_I2
     * @type {Integer (Int32)}
     */
    static I2 => 2

    /**
     * Native name: SF_I4
     * @type {Integer (Int32)}
     */
    static I4 => 3

    /**
     * Native name: SF_I8
     * @type {Integer (Int32)}
     */
    static I8 => 20

    /**
     * Native name: SF_BSTR
     * @type {Integer (Int32)}
     */
    static BSTR => 8

    /**
     * Native name: SF_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 13

    /**
     * Native name: SF_DISPATCH
     * @type {Integer (Int32)}
     */
    static DISPATCH => 9

    /**
     * Native name: SF_VARIANT
     * @type {Integer (Int32)}
     */
    static VARIANT => 12

    /**
     * Native name: SF_RECORD
     * @type {Integer (Int32)}
     */
    static RECORD => 36

    /**
     * Native name: SF_HAVEIID
     * @type {Integer (Int32)}
     */
    static HAVEIID => 32781
}
