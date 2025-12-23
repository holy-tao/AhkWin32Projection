#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class ExtendedErrorParamTypes extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eeptAnsiString => 1

    /**
     * @type {Integer (Int32)}
     */
    static eeptUnicodeString => 2

    /**
     * @type {Integer (Int32)}
     */
    static eeptLongVal => 3

    /**
     * @type {Integer (Int32)}
     */
    static eeptShortVal => 4

    /**
     * @type {Integer (Int32)}
     */
    static eeptPointerVal => 5

    /**
     * @type {Integer (Int32)}
     */
    static eeptNone => 6

    /**
     * @type {Integer (Int32)}
     */
    static eeptBinary => 7
}
