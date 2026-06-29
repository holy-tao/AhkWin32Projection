#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFT_AUDIO_DECODER_DEGRADATION_REASON {
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
    static MFT_AUDIO_DECODER_DEGRADATION_REASON_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFT_AUDIO_DECODER_DEGRADATION_REASON_LICENSING_REQUIREMENT => 1
}
