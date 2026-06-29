#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_IMPORT_PUBLIC_KEY_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_OID_INFO_PUBKEY_SIGN_KEY_FLAG => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_OID_INFO_PUBKEY_ENCRYPT_KEY_FLAG => 1073741824
}
