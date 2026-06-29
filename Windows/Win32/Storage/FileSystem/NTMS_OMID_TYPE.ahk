#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NTMS_OMID_TYPE {
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
    static NTMS_OMID_TYPE_FILESYSTEM_INFO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NTMS_OMID_TYPE_RAW_LABEL => 1
}
