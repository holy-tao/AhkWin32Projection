#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_STACK_TYPE extends Win32Enum {

    /**
     * Native name: StorageStackTypeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: StorageStackTypeScsi
     * @type {Integer (Int32)}
     */
    static Scsi => 1

    /**
     * Native name: StorageStackTypeNVMe
     * @type {Integer (Int32)}
     */
    static TypeNVMe => 2
}
