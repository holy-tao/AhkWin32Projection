#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechGrammarRules extends Win32Enum {

    /**
     * Native name: DISPID_SGRsCount
     * @type {Integer (Int32)}
     */
    static SGRsCount => 1

    /**
     * Native name: DISPID_SGRsDynamic
     * @type {Integer (Int32)}
     */
    static SGRsDynamic => 2

    /**
     * Native name: DISPID_SGRsAdd
     * @type {Integer (Int32)}
     */
    static SGRsAdd => 3

    /**
     * Native name: DISPID_SGRsCommit
     * @type {Integer (Int32)}
     */
    static SGRsCommit => 4

    /**
     * Native name: DISPID_SGRsCommitAndSave
     * @type {Integer (Int32)}
     */
    static SGRsCommitAndSave => 5

    /**
     * Native name: DISPID_SGRsFindRule
     * @type {Integer (Int32)}
     */
    static SGRsFindRule => 6

    /**
     * Native name: DISPID_SGRsItem
     * @type {Integer (Int32)}
     */
    static SGRsItem => 0

    /**
     * Native name: DISPID_SGRs_NewEnum
     * @type {Integer (Int32)}
     */
    static SGRs_NewEnum => -4
}
