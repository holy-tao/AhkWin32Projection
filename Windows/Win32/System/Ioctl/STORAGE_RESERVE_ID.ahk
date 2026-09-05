#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_RESERVE_ID extends Win32Enum {

    /**
     * Native name: StorageReserveIdNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: StorageReserveIdHard
     * @type {Integer (Int32)}
     */
    static Hard => 1

    /**
     * Native name: StorageReserveIdSoft
     * @type {Integer (Int32)}
     */
    static Soft => 2

    /**
     * Native name: StorageReserveIdUpdateScratch
     * @type {Integer (Int32)}
     */
    static UpdateScratch => 3

    /**
     * Native name: StorageReserveIdMax
     * @type {Integer (Int32)}
     */
    static Max => 4
}
