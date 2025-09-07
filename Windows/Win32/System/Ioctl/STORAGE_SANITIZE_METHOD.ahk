#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_SANITIZE_METHOD{

    /**
     * @type {Integer (Int32)}
     */
    static StorageSanitizeMethodDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorageSanitizeMethodBlockErase => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorageSanitizeMethodCryptoErase => 2
}
