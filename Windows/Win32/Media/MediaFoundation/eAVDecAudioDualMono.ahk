#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether the input audio stream is stereo or dual mono. This enumeration is used with the AVDecAudioDualMono property.
 * @remarks
 * In dual mono encoding, each channel is encoded separately. In stereo encoding, both channels are encoded together.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdecaudiodualmono
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVDecAudioDualMono {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The input bit stream is not dual mono.
     * @type {Integer (Int32)}
     */
    static eAVDecAudioDualMono_IsNotDualMono => 0

    /**
     * The input bit stream is dual mono.
     * @type {Integer (Int32)}
     */
    static eAVDecAudioDualMono_IsDualMono => 1

    /**
     * There is no indication in the bit stream whether the audio is dual mono.
     * @type {Integer (Int32)}
     */
    static eAVDecAudioDualMono_UnSpecified => 2
}
