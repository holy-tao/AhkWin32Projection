#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechObjectTokenCategory extends Win32Enum {

    /**
     * Native name: DISPID_SOTCId
     * @type {Integer (Int32)}
     */
    static SOTCId => 1

    /**
     * Native name: DISPID_SOTCDefault
     * @type {Integer (Int32)}
     */
    static SOTCDefault => 2

    /**
     * Native name: DISPID_SOTCSetId
     * @type {Integer (Int32)}
     */
    static SOTCSetId => 3

    /**
     * Native name: DISPID_SOTCGetDataKey
     * @type {Integer (Int32)}
     */
    static SOTCGetDataKey => 4

    /**
     * Native name: DISPID_SOTCEnumerateTokens
     * @type {Integer (Int32)}
     */
    static SOTCEnumerateTokens => 5
}
