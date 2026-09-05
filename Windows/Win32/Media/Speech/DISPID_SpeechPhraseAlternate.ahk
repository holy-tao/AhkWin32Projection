#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechPhraseAlternate extends Win32Enum {

    /**
     * Native name: DISPID_SPARecoResult
     * @type {Integer (Int32)}
     */
    static SPARecoResult => 1

    /**
     * Native name: DISPID_SPAStartElementInResult
     * @type {Integer (Int32)}
     */
    static SPAStartElementInResult => 2

    /**
     * Native name: DISPID_SPANumberOfElementsInResult
     * @type {Integer (Int32)}
     */
    static SPANumberOfElementsInResult => 3

    /**
     * Native name: DISPID_SPAPhraseInfo
     * @type {Integer (Int32)}
     */
    static SPAPhraseInfo => 4

    /**
     * Native name: DISPID_SPACommit
     * @type {Integer (Int32)}
     */
    static SPACommit => 5
}
