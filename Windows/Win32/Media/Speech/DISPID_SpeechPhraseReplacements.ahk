#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechPhraseReplacements extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRsCount => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRsItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRs_NewEnum => -4
}
