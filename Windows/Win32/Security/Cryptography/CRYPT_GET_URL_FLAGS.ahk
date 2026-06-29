#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_GET_URL_FLAGS {
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
    static CRYPT_GET_URL_FROM_PROPERTY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_GET_URL_FROM_EXTENSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_GET_URL_FROM_UNAUTH_ATTRIBUTE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_GET_URL_FROM_AUTH_ATTRIBUTE => 8
}
