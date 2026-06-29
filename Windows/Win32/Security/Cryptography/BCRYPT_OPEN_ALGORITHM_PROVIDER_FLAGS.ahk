#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_OPEN_ALGORITHM_PROVIDER_FLAGS {
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
    static BCRYPT_ALG_HANDLE_HMAC_FLAG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_PROV_DISPATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_HASH_REUSABLE_FLAG => 32
}
