#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechGrammarRules extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRsCount => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRsDynamic => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRsAdd => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRsCommit => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRsCommitAndSave => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRsFindRule => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRsItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRs_NewEnum => -4
}
