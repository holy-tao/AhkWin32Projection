#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsReadWriteCharacteristics{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIARW_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIARW_REWRITABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIARW_WRITEONCE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIARW_READONLY => 3
}
