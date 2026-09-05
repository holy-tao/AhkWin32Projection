#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class Direction extends Win32Enum {

    /**
     * Native name: DirectionEncrypt
     * @type {Integer (Int32)}
     */
    static Encrypt => 1

    /**
     * Native name: DirectionDecrypt
     * @type {Integer (Int32)}
     */
    static Decrypt => 2
}
