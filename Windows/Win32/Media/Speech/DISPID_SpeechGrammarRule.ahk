#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechGrammarRule extends Win32Enum {

    /**
     * Native name: DISPID_SGRAttributes
     * @type {Integer (Int32)}
     */
    static SGRAttributes => 1

    /**
     * Native name: DISPID_SGRInitialState
     * @type {Integer (Int32)}
     */
    static SGRInitialState => 2

    /**
     * Native name: DISPID_SGRName
     * @type {Integer (Int32)}
     */
    static SGRName => 3

    /**
     * Native name: DISPID_SGRId
     * @type {Integer (Int32)}
     */
    static SGRId => 4

    /**
     * Native name: DISPID_SGRClear
     * @type {Integer (Int32)}
     */
    static SGRClear => 5

    /**
     * Native name: DISPID_SGRAddResource
     * @type {Integer (Int32)}
     */
    static SGRAddResource => 6

    /**
     * Native name: DISPID_SGRAddState
     * @type {Integer (Int32)}
     */
    static SGRAddState => 7
}
