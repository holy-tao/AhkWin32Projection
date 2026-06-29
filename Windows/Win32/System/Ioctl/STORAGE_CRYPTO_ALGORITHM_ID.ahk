#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_CRYPTO_ALGORITHM_ID {
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
    static StorageCryptoAlgorithmUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorageCryptoAlgorithmXTSAES => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorageCryptoAlgorithmBitlockerAESCBC => 2

    /**
     * @type {Integer (Int32)}
     */
    static StorageCryptoAlgorithmAESECB => 3

    /**
     * @type {Integer (Int32)}
     */
    static StorageCryptoAlgorithmESSIVAESCBC => 4

    /**
     * @type {Integer (Int32)}
     */
    static StorageCryptoAlgorithmMax => 5

    /**
     * @type {Integer (Int32)}
     */
    static StorCryptoAlgorithmUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorCryptoAlgorithmXTSAES => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorCryptoAlgorithmBitlockerAESCBC => 2

    /**
     * @type {Integer (Int32)}
     */
    static StorCryptoAlgorithmAESECB => 3

    /**
     * @type {Integer (Int32)}
     */
    static StorCryptoAlgorithmESSIVAESCBC => 4
}
