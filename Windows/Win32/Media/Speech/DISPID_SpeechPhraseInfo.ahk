#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechPhraseInfo extends Win32Enum {

    /**
     * Native name: DISPID_SPILanguageId
     * @type {Integer (Int32)}
     */
    static SPILanguageId => 1

    /**
     * Native name: DISPID_SPIGrammarId
     * @type {Integer (Int32)}
     */
    static SPIGrammarId => 2

    /**
     * Native name: DISPID_SPIStartTime
     * @type {Integer (Int32)}
     */
    static SPIStartTime => 3

    /**
     * Native name: DISPID_SPIAudioStreamPosition
     * @type {Integer (Int32)}
     */
    static SPIAudioStreamPosition => 4

    /**
     * Native name: DISPID_SPIAudioSizeBytes
     * @type {Integer (Int32)}
     */
    static SPIAudioSizeBytes => 5

    /**
     * Native name: DISPID_SPIRetainedSizeBytes
     * @type {Integer (Int32)}
     */
    static SPIRetainedSizeBytes => 6

    /**
     * Native name: DISPID_SPIAudioSizeTime
     * @type {Integer (Int32)}
     */
    static SPIAudioSizeTime => 7

    /**
     * Native name: DISPID_SPIRule
     * @type {Integer (Int32)}
     */
    static SPIRule => 8

    /**
     * Native name: DISPID_SPIProperties
     * @type {Integer (Int32)}
     */
    static SPIProperties => 9

    /**
     * Native name: DISPID_SPIElements
     * @type {Integer (Int32)}
     */
    static SPIElements => 10

    /**
     * Native name: DISPID_SPIReplacements
     * @type {Integer (Int32)}
     */
    static SPIReplacements => 11

    /**
     * Native name: DISPID_SPIEngineId
     * @type {Integer (Int32)}
     */
    static SPIEngineId => 12

    /**
     * Native name: DISPID_SPIEnginePrivateData
     * @type {Integer (Int32)}
     */
    static SPIEnginePrivateData => 13

    /**
     * Native name: DISPID_SPISaveToMemory
     * @type {Integer (Int32)}
     */
    static SPISaveToMemory => 14

    /**
     * Native name: DISPID_SPIGetText
     * @type {Integer (Int32)}
     */
    static SPIGetText => 15

    /**
     * Native name: DISPID_SPIGetDisplayAttributes
     * @type {Integer (Int32)}
     */
    static SPIGetDisplayAttributes => 16
}
