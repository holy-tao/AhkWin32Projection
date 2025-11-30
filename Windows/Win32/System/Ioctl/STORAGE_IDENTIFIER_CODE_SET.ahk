#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_IDENTIFIER_CODE_SET extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static StorageIdCodeSetReserved => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorageIdCodeSetBinary => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorageIdCodeSetAscii => 2

    /**
     * @type {Integer (Int32)}
     */
    static StorageIdCodeSetUtf8 => 3
}
