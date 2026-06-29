#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether a public key algorithm is used for signing or for encryption.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-objectidpublickeyflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ObjectIdPublicKeyFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
