#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechRecoContextEvents extends Win32Enum {

    /**
     * Native name: DISPID_SRCEStartStream
     * @type {Integer (Int32)}
     */
    static SRCEStartStream => 1

    /**
     * Native name: DISPID_SRCEEndStream
     * @type {Integer (Int32)}
     */
    static SRCEEndStream => 2

    /**
     * Native name: DISPID_SRCEBookmark
     * @type {Integer (Int32)}
     */
    static SRCEBookmark => 3

    /**
     * Native name: DISPID_SRCESoundStart
     * @type {Integer (Int32)}
     */
    static SRCESoundStart => 4

    /**
     * Native name: DISPID_SRCESoundEnd
     * @type {Integer (Int32)}
     */
    static SRCESoundEnd => 5

    /**
     * Native name: DISPID_SRCEPhraseStart
     * @type {Integer (Int32)}
     */
    static SRCEPhraseStart => 6

    /**
     * Native name: DISPID_SRCERecognition
     * @type {Integer (Int32)}
     */
    static SRCERecognition => 7

    /**
     * Native name: DISPID_SRCEHypothesis
     * @type {Integer (Int32)}
     */
    static SRCEHypothesis => 8

    /**
     * Native name: DISPID_SRCEPropertyNumberChange
     * @type {Integer (Int32)}
     */
    static SRCEPropertyNumberChange => 9

    /**
     * Native name: DISPID_SRCEPropertyStringChange
     * @type {Integer (Int32)}
     */
    static SRCEPropertyStringChange => 10

    /**
     * Native name: DISPID_SRCEFalseRecognition
     * @type {Integer (Int32)}
     */
    static SRCEFalseRecognition => 11

    /**
     * Native name: DISPID_SRCEInterference
     * @type {Integer (Int32)}
     */
    static SRCEInterference => 12

    /**
     * Native name: DISPID_SRCERequestUI
     * @type {Integer (Int32)}
     */
    static SRCERequestUI => 13

    /**
     * Native name: DISPID_SRCERecognizerStateChange
     * @type {Integer (Int32)}
     */
    static SRCERecognizerStateChange => 14

    /**
     * Native name: DISPID_SRCEAdaptation
     * @type {Integer (Int32)}
     */
    static SRCEAdaptation => 15

    /**
     * Native name: DISPID_SRCERecognitionForOtherContext
     * @type {Integer (Int32)}
     */
    static SRCERecognitionForOtherContext => 16

    /**
     * Native name: DISPID_SRCEAudioLevel
     * @type {Integer (Int32)}
     */
    static SRCEAudioLevel => 17

    /**
     * Native name: DISPID_SRCEEnginePrivate
     * @type {Integer (Int32)}
     */
    static SRCEEnginePrivate => 18
}
