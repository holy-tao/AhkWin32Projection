#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_ENCRYPTION_TYPE extends Win32Enum {

    /**
     * Native name: StorageEncryptionTypeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: StorageEncryptionTypeEDrive
     * @type {Integer (Int32)}
     */
    static TypeEDrive => 1

    /**
     * Native name: StorageEncryptionTypeTcgOpal
     * @type {Integer (Int32)}
     */
    static TcgOpal => 2
}
