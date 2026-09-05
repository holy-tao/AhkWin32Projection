#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class CSV_DOWN_LEVEL_FILE_TYPE extends Win32Enum {

    /**
     * Native name: CsvDownLevelFileObject
     * @type {Integer (Int32)}
     */
    static Object => 0

    /**
     * Native name: CsvCsvFsInternalFileObject
     * @type {Integer (Int32)}
     */
    static CsvFsInternalFileObject => 1
}
