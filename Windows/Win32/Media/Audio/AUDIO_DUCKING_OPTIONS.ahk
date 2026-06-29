#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies audio ducking options. Use values from this enumeration when calling IAudioClientDuckingControl::SetDuckingOptionsForCurrentStream
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/ne-audioclient-audio_ducking_options
 * @namespace Windows.Win32.Media.Audio
 */
export default struct AUDIO_DUCKING_OPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The associated audio stream should use the default audio ducking behavior.
     * @type {Integer (Int32)}
     */
    static AUDIO_DUCKING_OPTIONS_DEFAULT => 0

    /**
     * The associated audio stream should not cause other streams to be ducked.
     * @type {Integer (Int32)}
     */
    static AUDIO_DUCKING_OPTIONS_DO_NOT_DUCK_OTHER_STREAMS => 1
}
