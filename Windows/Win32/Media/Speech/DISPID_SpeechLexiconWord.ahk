#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechLexiconWord extends Win32Enum {

    /**
     * Native name: DISPID_SLWLangId
     * @type {Integer (Int32)}
     */
    static SLWLangId => 1

    /**
     * Native name: DISPID_SLWType
     * @type {Integer (Int32)}
     */
    static SLWType => 2

    /**
     * Native name: DISPID_SLWWord
     * @type {Integer (Int32)}
     */
    static SLWWord => 3

    /**
     * Native name: DISPID_SLWPronunciations
     * @type {Integer (Int32)}
     */
    static SLWPronunciations => 4
}
