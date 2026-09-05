#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether the audio content contains music or voice. This enumeration is used with the AVEncAudioInputContent property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencaudioinputcontent
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncAudioInputContent extends Win32Enum {

    /**
     * The audio content is not known.
     * Native name: AVEncAudioInputContent_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The audio contains voice.
     * Native name: AVEncAudioInputContent_Voice
     * @type {Integer (Int32)}
     */
    static Voice => 1

    /**
     * The audio contains music.
     * Native name: AVEncAudioInputContent_Music
     * @type {Integer (Int32)}
     */
    static Music => 2
}
