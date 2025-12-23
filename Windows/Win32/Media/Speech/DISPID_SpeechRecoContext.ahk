#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechRecoContext extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCRecognizer => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCAudioInInterferenceStatus => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCRequestedUIType => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCVoice => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRAllowVoiceFormatMatchingOnNextSet => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCVoicePurgeEvent => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCEventInterests => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCCmdMaxAlternates => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCState => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCRetainedAudio => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCRetainedAudioFormat => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCPause => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCResume => 13

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCCreateGrammar => 14

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCCreateResultFromMemory => 15

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCBookmark => 16

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCSetAdaptationData => 17
}
