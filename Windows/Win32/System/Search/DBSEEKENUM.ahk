#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBSEEKENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBSEEK_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBSEEK_FIRSTEQ => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBSEEK_LASTEQ => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBSEEK_AFTEREQ => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBSEEK_AFTER => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBSEEK_BEFOREEQ => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBSEEK_BEFORE => 32
}
