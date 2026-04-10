#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class Direction extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DirectionEncrypt => 1

    /**
     * @type {Integer (Int32)}
     */
    static DirectionDecrypt => 2
}
