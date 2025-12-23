#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechLexicon extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLGenerationId => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLGetWords => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLAddPronunciation => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLAddPronunciationByPhoneIds => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLRemovePronunciation => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLRemovePronunciationByPhoneIds => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLGetPronunciations => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLGetGenerationChange => 8
}
