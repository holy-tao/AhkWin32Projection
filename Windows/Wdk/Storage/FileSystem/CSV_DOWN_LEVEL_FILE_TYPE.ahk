#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct CSV_DOWN_LEVEL_FILE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static CsvDownLevelFileObject => 0

    /**
     * @type {Integer (Int32)}
     */
    static CsvCsvFsInternalFileObject => 1
}
