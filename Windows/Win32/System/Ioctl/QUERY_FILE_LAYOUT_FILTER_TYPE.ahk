#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct QUERY_FILE_LAYOUT_FILTER_TYPE {
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
    static QUERY_FILE_LAYOUT_FILTER_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_FILE_LAYOUT_FILTER_TYPE_CLUSTERS => 1

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_FILE_LAYOUT_FILTER_TYPE_FILEID => 2

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_FILE_LAYOUT_FILTER_TYPE_STORAGE_RESERVE_ID => 3

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_FILE_LAYOUT_NUM_FILTER_TYPES => 4
}
