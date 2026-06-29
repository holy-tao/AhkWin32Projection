#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_ACQUIRE_FLAGS {
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
    static CRYPT_ACQUIRE_CACHE_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_USE_PROV_INFO_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_COMPARE_KEY_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_NO_HEALING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_SILENT_FLAG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_WINDOW_HANDLE_FLAG => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_NCRYPT_KEY_FLAGS_MASK => 458752

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_ALLOW_NCRYPT_KEY_FLAG => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_PREFER_NCRYPT_KEY_FLAG => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ACQUIRE_ONLY_NCRYPT_KEY_FLAG => 262144
}
