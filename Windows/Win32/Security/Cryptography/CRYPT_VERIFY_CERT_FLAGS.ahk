#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_VERIFY_CERT_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_VERIFY_CERT_SIGN_DISABLE_MD2_MD4_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_VERIFY_CERT_SIGN_SET_STRONG_PROPERTIES_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_VERIFY_CERT_SIGN_RETURN_STRONG_PROPERTIES_FLAG => 4
}
