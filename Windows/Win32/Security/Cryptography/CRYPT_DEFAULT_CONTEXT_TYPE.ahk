#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_DEFAULT_CONTEXT_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_DEFAULT_CONTEXT_CERT_SIGN_OID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_DEFAULT_CONTEXT_MULTI_CERT_SIGN_OID => 2
}
