#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_POSTOP_CALLBACK_STATUS {
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
    static FLT_POSTOP_FINISHED_PROCESSING => 0

    /**
     * @type {Integer (Int32)}
     */
    static FLT_POSTOP_MORE_PROCESSING_REQUIRED => 1

    /**
     * @type {Integer (Int32)}
     */
    static FLT_POSTOP_DISALLOW_FSFILTER_IO => 2
}
