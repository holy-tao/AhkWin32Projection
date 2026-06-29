#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct REPLACE_FILE_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static REPLACEFILE_WRITE_THROUGH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REPLACEFILE_IGNORE_MERGE_ERRORS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REPLACEFILE_IGNORE_ACL_ERRORS => 4
}
