#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether the audio content contains music or voice. This enumeration is used with the AVEncAudioInputContent property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencaudioinputcontent
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncAudioInputContent {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The audio content is not known.
     * @type {Integer (Int32)}
     */
    static AVEncAudioInputContent_Unknown => 0

    /**
     * The audio contains voice.
     * @type {Integer (Int32)}
     */
    static AVEncAudioInputContent_Voice => 1

    /**
     * The audio contains music.
     * @type {Integer (Int32)}
     */
    static AVEncAudioInputContent_Music => 2
}
