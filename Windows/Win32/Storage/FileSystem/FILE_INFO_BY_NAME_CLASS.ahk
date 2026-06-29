#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_INFO_BY_NAME_CLASS {
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
    static FileStatByNameInfo => 0

    /**
     * @type {Integer (Int32)}
     */
    static FileStatLxByNameInfo => 1

    /**
     * @type {Integer (Int32)}
     */
    static FileCaseSensitiveByNameInfo => 2

    /**
     * @type {Integer (Int32)}
     */
    static FileStatBasicByNameInfo => 3

    /**
     * @type {Integer (Int32)}
     */
    static MaximumFileInfoByNameClass => 4
}
