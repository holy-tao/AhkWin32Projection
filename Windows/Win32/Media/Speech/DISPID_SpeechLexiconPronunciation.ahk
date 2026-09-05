#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechLexiconPronunciation extends Win32Enum {

    /**
     * Native name: DISPID_SLPType
     * @type {Integer (Int32)}
     */
    static SLPType => 1

    /**
     * Native name: DISPID_SLPLangId
     * @type {Integer (Int32)}
     */
    static SLPLangId => 2

    /**
     * Native name: DISPID_SLPPartOfSpeech
     * @type {Integer (Int32)}
     */
    static SLPPartOfSpeech => 3

    /**
     * Native name: DISPID_SLPPhoneIds
     * @type {Integer (Int32)}
     */
    static SLPPhoneIds => 4

    /**
     * Native name: DISPID_SLPSymbolic
     * @type {Integer (Int32)}
     */
    static SLPSymbolic => 5
}
