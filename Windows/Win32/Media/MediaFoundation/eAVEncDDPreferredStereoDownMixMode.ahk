#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the preferred stereo downmix mode for a Dolby Digital audio stream. This enumeration is used with the AVEncDDPreferredStereoDownMixMode property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencddpreferredstereodownmixmode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncDDPreferredStereoDownMixMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Left total/right total (Lt/Rt) downmix.
     * @type {Integer (Int32)}
     */
    static eAVEncDDPreferredStereoDownMixMode_LtRt => 0

    /**
     * Left only/right only (Lo/Ro) downmix.
     * @type {Integer (Int32)}
     */
    static eAVEncDDPreferredStereoDownMixMode_LoRo => 1
}
