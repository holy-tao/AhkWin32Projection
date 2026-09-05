#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsCreateOptions extends Win32Enum {

    /**
     * Native name: NTMS_OPEN_EXISTING
     * @type {Integer (Int32)}
     */
    static OPEN_EXISTING => 1

    /**
     * Native name: NTMS_CREATE_NEW
     * @type {Integer (Int32)}
     */
    static NEW => 2

    /**
     * Native name: NTMS_OPEN_ALWAYS
     * @type {Integer (Int32)}
     */
    static OPEN_ALWAYS => 3
}
