#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_ASSOCIATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static StorageIdAssocDevice => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorageIdAssocPort => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorageIdAssocTarget => 2
}
