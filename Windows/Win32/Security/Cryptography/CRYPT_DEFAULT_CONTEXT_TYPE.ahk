#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_DEFAULT_CONTEXT_TYPE extends Win32Enum {

    /**
     * Native name: CRYPT_DEFAULT_CONTEXT_CERT_SIGN_OID
     * @type {Integer (UInt32)}
     */
    static CERT_SIGN_OID => 1

    /**
     * Native name: CRYPT_DEFAULT_CONTEXT_MULTI_CERT_SIGN_OID
     * @type {Integer (UInt32)}
     */
    static MULTI_CERT_SIGN_OID => 2
}
