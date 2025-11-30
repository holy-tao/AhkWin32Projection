#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class CSV_DOWN_LEVEL_FILE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CsvDownLevelFileObject => 0

    /**
     * @type {Integer (Int32)}
     */
    static CsvCsvFsInternalFileObject => 1
}
