#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechRecoContextEvents extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCEStartStream => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCEEndStream => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCEBookmark => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCESoundStart => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCESoundEnd => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCEPhraseStart => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCERecognition => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCEHypothesis => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCEPropertyNumberChange => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCEPropertyStringChange => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCEFalseRecognition => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCEInterference => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCERequestUI => 13

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCERecognizerStateChange => 14

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCEAdaptation => 15

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCERecognitionForOtherContext => 16

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCEAudioLevel => 17

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCEEnginePrivate => 18
}
