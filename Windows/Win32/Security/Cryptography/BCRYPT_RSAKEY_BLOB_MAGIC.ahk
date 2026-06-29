#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_RSAKEY_BLOB_MAGIC {
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
    static BCRYPT_RSAPUBLIC_MAGIC => 826364754

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_RSAPRIVATE_MAGIC => 843141970

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_RSAFULLPRIVATE_MAGIC => 859919186
}
