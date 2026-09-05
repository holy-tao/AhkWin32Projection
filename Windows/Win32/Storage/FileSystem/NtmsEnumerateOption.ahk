#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsEnumerateOption extends Win32Enum {

    /**
     * Native name: NTMS_ENUM_DEFAULT
     * @type {Integer (Int32)}
     */
    static ENUM_DEFAULT => 0

    /**
     * Native name: NTMS_ENUM_ROOTPOOL
     * @type {Integer (Int32)}
     */
    static ENUM_ROOTPOOL => 1
}
