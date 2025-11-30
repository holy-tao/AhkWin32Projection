#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class HandleType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Asymmetric => 1

    /**
     * @type {Integer (Int32)}
     */
    static Symmetric => 2

    /**
     * @type {Integer (Int32)}
     */
    static Transform => 3

    /**
     * @type {Integer (Int32)}
     */
    static Hash => 4
}
