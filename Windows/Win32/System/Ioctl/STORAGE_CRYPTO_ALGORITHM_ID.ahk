#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_CRYPTO_ALGORITHM_ID extends Win32Enum{

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
