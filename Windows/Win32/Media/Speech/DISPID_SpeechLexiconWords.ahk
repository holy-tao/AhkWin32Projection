#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechLexiconWords extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLWsCount => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLWsItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLWs_NewEnum => -4
}
