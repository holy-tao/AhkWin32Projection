#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_MSE_OPUS_SUPPORT_TYPE {
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
    static MF_MSE_OPUS_SUPPORT_ON => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_MSE_OPUS_SUPPORT_OFF => 1
}
