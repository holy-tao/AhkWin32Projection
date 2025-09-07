#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether the audio content contains music or voice. This enumeration is used with the AVEncAudioInputContent property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencaudioinputcontent
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncAudioInputContent{

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
