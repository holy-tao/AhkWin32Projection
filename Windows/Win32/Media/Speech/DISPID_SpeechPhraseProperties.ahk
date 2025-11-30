#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechPhraseProperties extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPPsCount => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPPsItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPPs_NewEnum => -4
}
