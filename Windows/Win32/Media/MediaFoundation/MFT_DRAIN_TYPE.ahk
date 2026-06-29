#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFT_DRAIN_TYPE {
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
    static MFT_DRAIN_PRODUCE_TAILS => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFT_DRAIN_NO_TAILS => 1
}
