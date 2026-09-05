#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_CRYPTO_KEY_SIZE extends Win32Enum {

    /**
     * Native name: StorageCryptoKeySizeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: StorageCryptoKeySize128Bits
     * @type {Integer (Int32)}
     */
    static Size128Bits => 1

    /**
     * Native name: StorageCryptoKeySize192Bits
     * @type {Integer (Int32)}
     */
    static Size192Bits => 2

    /**
     * Native name: StorageCryptoKeySize256Bits
     * @type {Integer (Int32)}
     */
    static Size256Bits => 3

    /**
     * Native name: StorageCryptoKeySize512Bits
     * @type {Integer (Int32)}
     */
    static Size512Bits => 4

    /**
     * Native name: StorageCryptoKeySizeMax
     * @type {Integer (Int32)}
     */
    static Max => 5

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
