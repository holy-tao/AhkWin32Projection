#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class EXTENDED_AGP_REGISTER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IsochStatus => 0

    /**
     * @type {Integer (Int32)}
     */
    static AgpControl => 1

    /**
     * @type {Integer (Int32)}
     */
    static ApertureSize => 2

    /**
     * @type {Integer (Int32)}
     */
    static AperturePageSize => 3

    /**
     * @type {Integer (Int32)}
     */
    static GartLow => 4

    /**
     * @type {Integer (Int32)}
     */
    static GartHigh => 5

    /**
     * @type {Integer (Int32)}
     */
    static IsochCommand => 6
}
