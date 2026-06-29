#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_QUERY_PROVIDER_MODE {
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
    static CRYPT_ANY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_UM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_KM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_MM => 3
}
