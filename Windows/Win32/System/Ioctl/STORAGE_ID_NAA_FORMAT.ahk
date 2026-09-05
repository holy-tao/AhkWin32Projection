#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_ID_NAA_FORMAT extends Win32Enum {

    /**
     * Native name: StorageIdNAAFormatIEEEExtended
     * @type {Integer (Int32)}
     */
    static FormatIEEEExtended => 2

    /**
     * Native name: StorageIdNAAFormatIEEERegistered
     * @type {Integer (Int32)}
     */
    static FormatIEEERegistered => 3

    /**
     * Native name: StorageIdNAAFormatIEEEERegisteredExtended
     * @type {Integer (Int32)}
     */
    static FormatIEEEERegisteredExtended => 5
}
