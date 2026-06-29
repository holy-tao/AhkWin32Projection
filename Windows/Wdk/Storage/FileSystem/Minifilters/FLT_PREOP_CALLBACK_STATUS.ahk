#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_PREOP_CALLBACK_STATUS {
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
    static FLT_PREOP_SUCCESS_WITH_CALLBACK => 0

    /**
     * @type {Integer (Int32)}
     */
    static FLT_PREOP_SUCCESS_NO_CALLBACK => 1

    /**
     * @type {Integer (Int32)}
     */
    static FLT_PREOP_PENDING => 2

    /**
     * @type {Integer (Int32)}
     */
    static FLT_PREOP_DISALLOW_FASTIO => 3

    /**
     * @type {Integer (Int32)}
     */
    static FLT_PREOP_COMPLETE => 4

    /**
     * @type {Integer (Int32)}
     */
    static FLT_PREOP_SYNCHRONIZE => 5

    /**
     * @type {Integer (Int32)}
     */
    static FLT_PREOP_DISALLOW_FSFILTER_IO => 6
}
