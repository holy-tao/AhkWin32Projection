#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFT_AUDIO_DECODER_DEGRADATION_TYPE {
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
    static MFT_AUDIO_DECODER_DEGRADATION_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFT_AUDIO_DECODER_DEGRADATION_TYPE_DOWNMIX2CHANNEL => 1

    /**
     * @type {Integer (Int32)}
     */
    static MFT_AUDIO_DECODER_DEGRADATION_TYPE_DOWNMIX6CHANNEL => 2

    /**
     * @type {Integer (Int32)}
     */
    static MFT_AUDIO_DECODER_DEGRADATION_TYPE_DOWNMIX8CHANNEL => 3
}
