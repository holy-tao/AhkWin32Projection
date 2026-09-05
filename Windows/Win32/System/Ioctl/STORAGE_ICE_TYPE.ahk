#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_ICE_TYPE extends Win32Enum {

    /**
     * Native name: StorageIceTypeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: StorageIceTypeUfs
     * @type {Integer (Int32)}
     */
    static Ufs => 1

    /**
     * Native name: StorageIceTypeNvme
     * @type {Integer (Int32)}
     */
    static Nvme => 2
}
