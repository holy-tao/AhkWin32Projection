#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class eTlsSignatureAlgorithm extends Win32Enum {

    /**
     * Native name: TlsSignatureAlgorithm_Anonymous
     * @type {Integer (Int32)}
     */
    static Anonymous => 0

    /**
     * Native name: TlsSignatureAlgorithm_Rsa
     * @type {Integer (Int32)}
     */
    static Rsa => 1

    /**
     * Native name: TlsSignatureAlgorithm_Dsa
     * @type {Integer (Int32)}
     */
    static Dsa => 2

    /**
     * Native name: TlsSignatureAlgorithm_Ecdsa
     * @type {Integer (Int32)}
     */
    static Ecdsa => 3
}
