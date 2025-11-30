#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechPartOfSpeech extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPSNotOverriden => -1

    /**
     * @type {Integer (Int32)}
     */
    static SPSUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPSNoun => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SPSVerb => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SPSModifier => 12288

    /**
     * @type {Integer (Int32)}
     */
    static SPSFunction => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SPSInterjection => 20480

    /**
     * @type {Integer (Int32)}
     */
    static SPSLMA => 28672

    /**
     * @type {Integer (Int32)}
     */
    static SPSSuppressWord => 61440
}
