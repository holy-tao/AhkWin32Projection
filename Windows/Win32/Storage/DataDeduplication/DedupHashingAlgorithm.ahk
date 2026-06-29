#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct DedupHashingAlgorithm {
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
    static DedupHashingAlgorithm_Unknonwn => 0

    /**
     * @type {Integer (Int32)}
     */
    static DedupHashingAlgorithm_V1 => 1
}
