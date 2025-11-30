#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechPhraseElement extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEAudioTimeOffset => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEAudioSizeTime => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEAudioStreamOffset => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEAudioSizeBytes => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPERetainedStreamOffset => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPERetainedSizeBytes => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEDisplayText => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPELexicalForm => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEPronunciation => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEDisplayAttributes => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPERequiredConfidence => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEActualConfidence => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEEngineConfidence => 13
}
