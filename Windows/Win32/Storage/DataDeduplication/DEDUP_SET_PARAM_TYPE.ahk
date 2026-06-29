#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct DEDUP_SET_PARAM_TYPE {
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
    static DEDUP_PT_MinChunkSizeBytes => 1

    /**
     * @type {Integer (Int32)}
     */
    static DEDUP_PT_MaxChunkSizeBytes => 2

    /**
     * @type {Integer (Int32)}
     */
    static DEDUP_PT_AvgChunkSizeBytes => 3

    /**
     * @type {Integer (Int32)}
     */
    static DEDUP_PT_InvariantChunking => 4

    /**
     * @type {Integer (Int32)}
     */
    static DEDUP_PT_DisableStrongHashComputation => 5
}
