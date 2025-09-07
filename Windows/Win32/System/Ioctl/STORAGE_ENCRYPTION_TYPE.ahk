#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_ENCRYPTION_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static StorageEncryptionTypeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorageEncryptionTypeEDrive => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorageEncryptionTypeTcgOpal => 2
}
