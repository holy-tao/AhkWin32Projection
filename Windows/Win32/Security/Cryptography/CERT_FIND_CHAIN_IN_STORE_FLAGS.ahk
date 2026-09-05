#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_FIND_CHAIN_IN_STORE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CERT_CHAIN_FIND_BY_ISSUER_COMPARE_KEY_FLAG
     * @type {Integer (UInt32)}
     */
    static FIND_BY_ISSUER_COMPARE_KEY_FLAG => 1

    /**
     * Native name: CERT_CHAIN_FIND_BY_ISSUER_COMPLEX_CHAIN_FLAG
     * @type {Integer (UInt32)}
     */
    static FIND_BY_ISSUER_COMPLEX_CHAIN_FLAG => 2

    /**
     * Native name: CERT_CHAIN_FIND_BY_ISSUER_CACHE_ONLY_FLAG
     * @type {Integer (UInt32)}
     */
    static FIND_BY_ISSUER_CACHE_ONLY_FLAG => 32768

    /**
     * Native name: CERT_CHAIN_FIND_BY_ISSUER_CACHE_ONLY_URL_FLAG
     * @type {Integer (UInt32)}
     */
    static FIND_BY_ISSUER_CACHE_ONLY_URL_FLAG => 4

    /**
     * Native name: CERT_CHAIN_FIND_BY_ISSUER_LOCAL_MACHINE_FLAG
     * @type {Integer (UInt32)}
     */
    static FIND_BY_ISSUER_LOCAL_MACHINE_FLAG => 8

    /**
     * Native name: CERT_CHAIN_FIND_BY_ISSUER_NO_KEY_FLAG
     * @type {Integer (UInt32)}
     */
    static FIND_BY_ISSUER_NO_KEY_FLAG => 16384
}
