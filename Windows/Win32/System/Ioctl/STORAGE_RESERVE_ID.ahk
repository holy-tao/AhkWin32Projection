#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_RESERVE_ID{

    /**
     * @type {Integer (Int32)}
     */
    static StorageReserveIdNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorageReserveIdHard => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorageReserveIdSoft => 2

    /**
     * @type {Integer (Int32)}
     */
    static StorageReserveIdUpdateScratch => 3

    /**
     * @type {Integer (Int32)}
     */
    static StorageReserveIdMax => 4
}
