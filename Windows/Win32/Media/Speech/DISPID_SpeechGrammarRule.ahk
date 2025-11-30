#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechGrammarRule extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRAttributes => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRInitialState => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRName => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRId => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRClear => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRAddResource => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRAddState => 7
}
