#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_SANITIZE_METHOD extends Win32Enum {

    /**
     * Native name: StorageSanitizeMethodDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: StorageSanitizeMethodBlockErase
     * @type {Integer (Int32)}
     */
    static BlockErase => 1

    /**
     * Native name: StorageSanitizeMethodCryptoErase
     * @type {Integer (Int32)}
     */
    static CryptoErase => 2
}
