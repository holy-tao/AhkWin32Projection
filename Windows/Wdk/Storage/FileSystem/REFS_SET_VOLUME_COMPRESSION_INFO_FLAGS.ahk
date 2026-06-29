#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REFS_SET_VOLUME_COMPRESSION_INFO_FLAGS {
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
    static REFS_SET_VOLUME_COMPRESSION_INFO_FLAG_COMPRESS_SYNC => 1

    /**
     * @type {Integer (Int32)}
     */
    static REFS_SET_VOLUME_COMPRESSION_INFO_FLAG_MAX => 1
}
