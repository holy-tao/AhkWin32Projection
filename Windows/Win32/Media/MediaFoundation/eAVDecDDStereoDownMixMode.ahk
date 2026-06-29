#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the stereo downmix mode for a Dolby Digital audio decoder.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdecddstereodownmixmode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVDecDDStereoDownMixMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The decoder selects the mode automatically.
     * @type {Integer (Int32)}
     */
    static eAVDecDDStereoDownMixMode_Auto => 0

    /**
     * Left total/right total (Lt/Rt) downmix. (Surround compatible.)
     * @type {Integer (Int32)}
     */
    static eAVDecDDStereoDownMixMode_LtRt => 1

    /**
     * Left only/right only (Lo/Ro) downmix. (Stereo.)
     * @type {Integer (Int32)}
     */
    static eAVDecDDStereoDownMixMode_LoRo => 2
}
