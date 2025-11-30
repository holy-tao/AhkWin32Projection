#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PaddingMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * @type {Integer (Int32)}
     */
    static PKCS7 => 2

    /**
     * @type {Integer (Int32)}
     */
    static Zeros => 3

    /**
     * @type {Integer (Int32)}
     */
    static ANSIX923 => 4

    /**
     * @type {Integer (Int32)}
     */
    static ISO10126 => 5
}
