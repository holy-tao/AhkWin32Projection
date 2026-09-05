#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_IDENTIFIER_CODE_SET extends Win32Enum {

    /**
     * Native name: StorageIdCodeSetReserved
     * @type {Integer (Int32)}
     */
    static IdCodeSetReserved => 0

    /**
     * Native name: StorageIdCodeSetBinary
     * @type {Integer (Int32)}
     */
    static IdCodeSetBinary => 1

    /**
     * Native name: StorageIdCodeSetAscii
     * @type {Integer (Int32)}
     */
    static IdCodeSetAscii => 2

    /**
     * Native name: StorageIdCodeSetUtf8
     * @type {Integer (Int32)}
     */
    static IdCodeSetUtf8 => 3
}
