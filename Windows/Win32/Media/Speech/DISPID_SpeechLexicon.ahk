#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechLexicon extends Win32Enum {

    /**
     * Native name: DISPID_SLGenerationId
     * @type {Integer (Int32)}
     */
    static SLGenerationId => 1

    /**
     * Native name: DISPID_SLGetWords
     * @type {Integer (Int32)}
     */
    static SLGetWords => 2

    /**
     * Native name: DISPID_SLAddPronunciation
     * @type {Integer (Int32)}
     */
    static SLAddPronunciation => 3

    /**
     * Native name: DISPID_SLAddPronunciationByPhoneIds
     * @type {Integer (Int32)}
     */
    static SLAddPronunciationByPhoneIds => 4

    /**
     * Native name: DISPID_SLRemovePronunciation
     * @type {Integer (Int32)}
     */
    static SLRemovePronunciation => 5

    /**
     * Native name: DISPID_SLRemovePronunciationByPhoneIds
     * @type {Integer (Int32)}
     */
    static SLRemovePronunciationByPhoneIds => 6

    /**
     * Native name: DISPID_SLGetPronunciations
     * @type {Integer (Int32)}
     */
    static SLGetPronunciations => 7

    /**
     * Native name: DISPID_SLGetGenerationChange
     * @type {Integer (Int32)}
     */
    static SLGetGenerationChange => 8
}
