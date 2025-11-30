#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_FIND_CHAIN_IN_STORE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CHAIN_FIND_BY_ISSUER_COMPARE_KEY_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CHAIN_FIND_BY_ISSUER_COMPLEX_CHAIN_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CHAIN_FIND_BY_ISSUER_CACHE_ONLY_FLAG => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CHAIN_FIND_BY_ISSUER_CACHE_ONLY_URL_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CHAIN_FIND_BY_ISSUER_LOCAL_MACHINE_FLAG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CHAIN_FIND_BY_ISSUER_NO_KEY_FLAG => 16384
}
