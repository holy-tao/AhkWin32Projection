#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_CRYPTO_ALGORITHM_ID extends Win32Enum {

    /**
     * Native name: StorageCryptoAlgorithmUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: StorageCryptoAlgorithmXTSAES
     * @type {Integer (Int32)}
     */
    static AlgorithmXTSAES => 1

    /**
     * Native name: StorageCryptoAlgorithmBitlockerAESCBC
     * @type {Integer (Int32)}
     */
    static BitlockerAESCBC => 2

    /**
     * Native name: StorageCryptoAlgorithmAESECB
     * @type {Integer (Int32)}
     */
    static AlgorithmAESECB => 3

    /**
     * Native name: StorageCryptoAlgorithmESSIVAESCBC
     * @type {Integer (Int32)}
     */
    static AlgorithmESSIVAESCBC => 4

    /**
     * Native name: StorageCryptoAlgorithmMax
     * @type {Integer (Int32)}
     */
    static Max => 5

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
