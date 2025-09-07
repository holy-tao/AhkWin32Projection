#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_CRYPTO_KEY_SIZE{

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
}
