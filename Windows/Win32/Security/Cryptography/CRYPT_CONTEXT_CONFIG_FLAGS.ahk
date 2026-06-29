#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_CONTEXT_CONFIG_FLAGS {
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
    static CRYPT_EXCLUSIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_OVERRIDE => 65536
}
