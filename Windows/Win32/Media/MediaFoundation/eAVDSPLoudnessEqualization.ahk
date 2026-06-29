#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether loudness equalization is enabled in an audio decoder or digital signal processor (DSP).
 * @remarks
 * Loudness equalization is a DSP process that maintains a consistent volume level when the audio stream changes.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdsploudnessequalization
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVDSPLoudnessEqualization {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Loudness equalization is disabled.
     * @type {Integer (Int32)}
     */
    static eAVDSPLoudnessEqualization_OFF => 0

    /**
     * Loudness equalization is enabled.
     * @type {Integer (Int32)}
     */
    static eAVDSPLoudnessEqualization_ON => 1

    /**
     * The decoder or DSP automatically selects the equalization mode.
     * @type {Integer (Int32)}
     */
    static eAVDSPLoudnessEqualization_AUTO => 2
}
