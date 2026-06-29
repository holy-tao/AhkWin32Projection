#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_DSA_MAGIC {
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
    static BCRYPT_DSA_PUBLIC_MAGIC => 1112560452

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_DSA_PRIVATE_MAGIC => 1448104772
}
