#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_VERIFY_CERT_FLAGS extends Win32Enum {

    /**
     * Native name: CRYPT_VERIFY_CERT_SIGN_DISABLE_MD2_MD4_FLAG
     * @type {Integer (UInt32)}
     */
    static SIGN_DISABLE_MD2_MD4_FLAG => 1

    /**
     * Native name: CRYPT_VERIFY_CERT_SIGN_SET_STRONG_PROPERTIES_FLAG
     * @type {Integer (UInt32)}
     */
    static SIGN_SET_STRONG_PROPERTIES_FLAG => 2

    /**
     * Native name: CRYPT_VERIFY_CERT_SIGN_RETURN_STRONG_PROPERTIES_FLAG
     * @type {Integer (UInt32)}
     */
    static SIGN_RETURN_STRONG_PROPERTIES_FLAG => 4
}
