#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class OS_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WIN_95 => 0

    /**
     * @type {Integer (Int32)}
     */
    static WIN_98 => 1

    /**
     * @type {Integer (Int32)}
     */
    static WIN_ME => 2

    /**
     * @type {Integer (Int32)}
     */
    static WIN_NT4 => 3

    /**
     * @type {Integer (Int32)}
     */
    static WIN_NT5 => 4

    /**
     * @type {Integer (Int32)}
     */
    static WIN_NT5_1 => 5

    /**
     * @type {Integer (Int32)}
     */
    static WIN_NT5_2 => 6

    /**
     * @type {Integer (Int32)}
     */
    static WIN_NT6_0 => 7

    /**
     * @type {Integer (Int32)}
     */
    static WIN_NT6_1 => 8

    /**
     * @type {Integer (Int32)}
     */
    static WIN_UNDEFINED => 255
}
