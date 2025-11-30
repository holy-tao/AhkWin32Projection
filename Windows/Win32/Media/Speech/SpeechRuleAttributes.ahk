#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechRuleAttributes extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SRATopLevel => 1

    /**
     * @type {Integer (Int32)}
     */
    static SRADefaultToActive => 2

    /**
     * @type {Integer (Int32)}
     */
    static SRAExport => 4

    /**
     * @type {Integer (Int32)}
     */
    static SRAImport => 8

    /**
     * @type {Integer (Int32)}
     */
    static SRAInterpreter => 16

    /**
     * @type {Integer (Int32)}
     */
    static SRADynamic => 32

    /**
     * @type {Integer (Int32)}
     */
    static SRARoot => 64
}
