#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_CRYPTO_KEY_SIZE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static StorageCryptoKeySizeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorageCryptoKeySize128Bits => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorageCryptoKeySize192Bits => 2

    /**
     * @type {Integer (Int32)}
     */
    static StorageCryptoKeySize256Bits => 3

    /**
     * @type {Integer (Int32)}
     */
    static StorageCryptoKeySize512Bits => 4

    /**
     * @type {Integer (Int32)}
     */
    static StorageCryptoKeySizeMax => 5

    /**
     * @type {Integer (Int32)}
     */
    static StorCryptoKeySizeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorCryptoKeySize128Bits => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorCryptoKeySize192Bits => 2

    /**
     * @type {Integer (Int32)}
     */
    static StorCryptoKeySize256Bits => 3

    /**
     * @type {Integer (Int32)}
     */
    static StorCryptoKeySize512Bits => 4
}
