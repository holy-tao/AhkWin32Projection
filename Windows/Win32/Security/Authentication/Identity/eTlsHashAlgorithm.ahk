#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class eTlsHashAlgorithm extends Win32Enum {

    /**
     * Native name: TlsHashAlgorithm_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: TlsHashAlgorithm_Md5
     * @type {Integer (Int32)}
     */
    static Md5 => 1

    /**
     * Native name: TlsHashAlgorithm_Sha1
     * @type {Integer (Int32)}
     */
    static Sha1 => 2

    /**
     * Native name: TlsHashAlgorithm_Sha224
     * @type {Integer (Int32)}
     */
    static Sha224 => 3

    /**
     * Native name: TlsHashAlgorithm_Sha256
     * @type {Integer (Int32)}
     */
    static Sha256 => 4

    /**
     * Native name: TlsHashAlgorithm_Sha384
     * @type {Integer (Int32)}
     */
    static Sha384 => 5

    /**
     * Native name: TlsHashAlgorithm_Sha512
     * @type {Integer (Int32)}
     */
    static Sha512 => 6
}
