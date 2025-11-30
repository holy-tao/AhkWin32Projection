#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechPhraseAlternates extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPAsCount => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPAsItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPAs_NewEnum => -4
}
