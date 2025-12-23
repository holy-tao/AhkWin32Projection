#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechLexiconWord extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLWLangId => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLWType => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLWWord => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLWPronunciations => 4
}
