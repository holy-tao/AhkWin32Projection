#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether a public key algorithm is used for signing or for encryption.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-objectidpublickeyflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ObjectIdPublicKeyFlags extends Win32Enum{

    /**
     * The algorithm can be used for signing or encryption.
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_OID_INFO_PUBKEY_ANY => 0

    /**
     * The algorithm is used for signing.
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_OID_INFO_PUBKEY_SIGN_KEY_FLAG => -2147483648

    /**
     * The algorithm is used for encryption.
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_OID_INFO_PUBKEY_ENCRYPT_KEY_FLAG => 1073741824
}
