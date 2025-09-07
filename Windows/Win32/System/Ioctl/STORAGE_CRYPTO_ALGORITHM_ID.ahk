#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_CRYPTO_ALGORITHM_ID{

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
}
