#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechPhraseElement extends Win32Enum {

    /**
     * Native name: DISPID_SPEAudioTimeOffset
     * @type {Integer (Int32)}
     */
    static SPEAudioTimeOffset => 1

    /**
     * Native name: DISPID_SPEAudioSizeTime
     * @type {Integer (Int32)}
     */
    static SPEAudioSizeTime => 2

    /**
     * Native name: DISPID_SPEAudioStreamOffset
     * @type {Integer (Int32)}
     */
    static SPEAudioStreamOffset => 3

    /**
     * Native name: DISPID_SPEAudioSizeBytes
     * @type {Integer (Int32)}
     */
    static SPEAudioSizeBytes => 4

    /**
     * Native name: DISPID_SPERetainedStreamOffset
     * @type {Integer (Int32)}
     */
    static SPERetainedStreamOffset => 5

    /**
     * Native name: DISPID_SPERetainedSizeBytes
     * @type {Integer (Int32)}
     */
    static SPERetainedSizeBytes => 6

    /**
     * Native name: DISPID_SPEDisplayText
     * @type {Integer (Int32)}
     */
    static SPEDisplayText => 7

    /**
     * Native name: DISPID_SPELexicalForm
     * @type {Integer (Int32)}
     */
    static SPELexicalForm => 8

    /**
     * Native name: DISPID_SPEPronunciation
     * @type {Integer (Int32)}
     */
    static SPEPronunciation => 9

    /**
     * Native name: DISPID_SPEDisplayAttributes
     * @type {Integer (Int32)}
     */
    static SPEDisplayAttributes => 10

    /**
     * Native name: DISPID_SPERequiredConfidence
     * @type {Integer (Int32)}
     */
    static SPERequiredConfidence => 11

    /**
     * Native name: DISPID_SPEActualConfidence
     * @type {Integer (Int32)}
     */
    static SPEActualConfidence => 12

    /**
     * Native name: DISPID_SPEEngineConfidence
     * @type {Integer (Int32)}
     */
    static SPEEngineConfidence => 13
}
