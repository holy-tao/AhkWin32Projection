#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_KEY_PARAM_ID {
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
    static KP_ALGID => 7

    /**
     * @type {Integer (UInt32)}
     */
    static KP_CERTIFICATE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static KP_PERMISSIONS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static KP_SALT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KP_SALT_EX => 10

    /**
     * @type {Integer (UInt32)}
     */
    static KP_BLOCKLEN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KP_GET_USE_COUNT => 42

    /**
     * @type {Integer (UInt32)}
     */
    static KP_KEYLEN => 9
}
