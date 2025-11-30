#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechVoice extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVStatus => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVVoice => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVAudioOutput => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVAudioOutputStream => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVRate => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVVolume => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVAllowAudioOuputFormatChangesOnNextSet => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEventInterests => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVPriority => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVAlertBoundary => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVSyncronousSpeakTimeout => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVSpeak => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVSpeakStream => 13

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVPause => 14

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVResume => 15

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVSkip => 16

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVGetVoices => 17

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVGetAudioOutputs => 18

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVWaitUntilDone => 19

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVSpeakCompleteEvent => 20

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVIsUISupported => 21

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVDisplayUI => 22
}
