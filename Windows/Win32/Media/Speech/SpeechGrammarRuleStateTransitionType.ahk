#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechGrammarRuleStateTransitionType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SGRSTTEpsilon => 0

    /**
     * @type {Integer (Int32)}
     */
    static SGRSTTWord => 1

    /**
     * @type {Integer (Int32)}
     */
    static SGRSTTRule => 2

    /**
     * @type {Integer (Int32)}
     */
    static SGRSTTDictation => 3

    /**
     * @type {Integer (Int32)}
     */
    static SGRSTTWildcard => 4

    /**
     * @type {Integer (Int32)}
     */
    static SGRSTTTextBuffer => 5
}
