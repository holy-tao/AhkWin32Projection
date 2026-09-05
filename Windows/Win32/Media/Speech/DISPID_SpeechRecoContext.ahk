#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechRecoContext extends Win32Enum {

    /**
     * Native name: DISPID_SRCRecognizer
     * @type {Integer (Int32)}
     */
    static SRCRecognizer => 1

    /**
     * Native name: DISPID_SRCAudioInInterferenceStatus
     * @type {Integer (Int32)}
     */
    static SRCAudioInInterferenceStatus => 2

    /**
     * Native name: DISPID_SRCRequestedUIType
     * @type {Integer (Int32)}
     */
    static SRCRequestedUIType => 3

    /**
     * Native name: DISPID_SRCVoice
     * @type {Integer (Int32)}
     */
    static SRCVoice => 4

    /**
     * Native name: DISPID_SRAllowVoiceFormatMatchingOnNextSet
     * @type {Integer (Int32)}
     */
    static SRAllowVoiceFormatMatchingOnNextSet => 5

    /**
     * Native name: DISPID_SRCVoicePurgeEvent
     * @type {Integer (Int32)}
     */
    static SRCVoicePurgeEvent => 6

    /**
     * Native name: DISPID_SRCEventInterests
     * @type {Integer (Int32)}
     */
    static SRCEventInterests => 7

    /**
     * Native name: DISPID_SRCCmdMaxAlternates
     * @type {Integer (Int32)}
     */
    static SRCCmdMaxAlternates => 8

    /**
     * Native name: DISPID_SRCState
     * @type {Integer (Int32)}
     */
    static SRCState => 9

    /**
     * Native name: DISPID_SRCRetainedAudio
     * @type {Integer (Int32)}
     */
    static SRCRetainedAudio => 10

    /**
     * Native name: DISPID_SRCRetainedAudioFormat
     * @type {Integer (Int32)}
     */
    static SRCRetainedAudioFormat => 11

    /**
     * Native name: DISPID_SRCPause
     * @type {Integer (Int32)}
     */
    static SRCPause => 12

    /**
     * Native name: DISPID_SRCResume
     * @type {Integer (Int32)}
     */
    static SRCResume => 13

    /**
     * Native name: DISPID_SRCCreateGrammar
     * @type {Integer (Int32)}
     */
    static SRCCreateGrammar => 14

    /**
     * Native name: DISPID_SRCCreateResultFromMemory
     * @type {Integer (Int32)}
     */
    static SRCCreateResultFromMemory => 15

    /**
     * Native name: DISPID_SRCBookmark
     * @type {Integer (Int32)}
     */
    static SRCBookmark => 16

    /**
     * Native name: DISPID_SRCSetAdaptationData
     * @type {Integer (Int32)}
     */
    static SRCSetAdaptationData => 17
}
