#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPTGENRANDOM_FLAGS {
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
    static BCRYPT_RNG_USE_ENTROPY_IN_BUFFER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_USE_SYSTEM_PREFERRED_RNG => 2
}
