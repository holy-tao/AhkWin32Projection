#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechRecoResult extends Win32Enum {

    /**
     * Native name: DISPID_SRRRecoContext
     * @type {Integer (Int32)}
     */
    static SRRRecoContext => 1

    /**
     * Native name: DISPID_SRRTimes
     * @type {Integer (Int32)}
     */
    static SRRTimes => 2

    /**
     * Native name: DISPID_SRRAudioFormat
     * @type {Integer (Int32)}
     */
    static SRRAudioFormat => 3

    /**
     * Native name: DISPID_SRRPhraseInfo
     * @type {Integer (Int32)}
     */
    static SRRPhraseInfo => 4

    /**
     * Native name: DISPID_SRRAlternates
     * @type {Integer (Int32)}
     */
    static SRRAlternates => 5

    /**
     * Native name: DISPID_SRRAudio
     * @type {Integer (Int32)}
     */
    static SRRAudio => 6

    /**
     * Native name: DISPID_SRRSpeakAudio
     * @type {Integer (Int32)}
     */
    static SRRSpeakAudio => 7

    /**
     * Native name: DISPID_SRRSaveToMemory
     * @type {Integer (Int32)}
     */
    static SRRSaveToMemory => 8

    /**
     * Native name: DISPID_SRRDiscardResultInfo
     * @type {Integer (Int32)}
     */
    static SRRDiscardResultInfo => 9
}
