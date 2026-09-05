#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_ASSOCIATION_TYPE extends Win32Enum {

    /**
     * Native name: StorageIdAssocDevice
     * @type {Integer (Int32)}
     */
    static IdAssocDevice => 0

    /**
     * Native name: StorageIdAssocPort
     * @type {Integer (Int32)}
     */
    static IdAssocPort => 1

    /**
     * Native name: StorageIdAssocTarget
     * @type {Integer (Int32)}
     */
    static IdAssocTarget => 2
}
