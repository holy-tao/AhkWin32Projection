#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsReadWriteCharacteristics extends Win32Enum {

    /**
     * Native name: NTMS_MEDIARW_UNKNOWN
     * @type {Integer (Int32)}
     */
    static MEDIARW_UNKNOWN => 0

    /**
     * Native name: NTMS_MEDIARW_REWRITABLE
     * @type {Integer (Int32)}
     */
    static MEDIARW_REWRITABLE => 1

    /**
     * Native name: NTMS_MEDIARW_WRITEONCE
     * @type {Integer (Int32)}
     */
    static MEDIARW_WRITEONCE => 2

    /**
     * Native name: NTMS_MEDIARW_READONLY
     * @type {Integer (Int32)}
     */
    static MEDIARW_READONLY => 3
}
