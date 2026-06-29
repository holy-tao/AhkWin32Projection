#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_DH_KEY_BLOB_MAGIC {
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
    static BCRYPT_DH_PUBLIC_MAGIC => 1112557636

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_DH_PRIVATE_MAGIC => 1448101956
}
