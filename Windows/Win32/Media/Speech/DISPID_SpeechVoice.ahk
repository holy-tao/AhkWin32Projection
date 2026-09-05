#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechVoice extends Win32Enum {

    /**
     * Native name: DISPID_SVStatus
     * @type {Integer (Int32)}
     */
    static SVStatus => 1

    /**
     * Native name: DISPID_SVVoice
     * @type {Integer (Int32)}
     */
    static SVVoice => 2

    /**
     * Native name: DISPID_SVAudioOutput
     * @type {Integer (Int32)}
     */
    static SVAudioOutput => 3

    /**
     * Native name: DISPID_SVAudioOutputStream
     * @type {Integer (Int32)}
     */
    static SVAudioOutputStream => 4

    /**
     * Native name: DISPID_SVRate
     * @type {Integer (Int32)}
     */
    static SVRate => 5

    /**
     * Native name: DISPID_SVVolume
     * @type {Integer (Int32)}
     */
    static SVVolume => 6

    /**
     * Native name: DISPID_SVAllowAudioOuputFormatChangesOnNextSet
     * @type {Integer (Int32)}
     */
    static SVAllowAudioOuputFormatChangesOnNextSet => 7

    /**
     * Native name: DISPID_SVEventInterests
     * @type {Integer (Int32)}
     */
    static SVEventInterests => 8

    /**
     * Native name: DISPID_SVPriority
     * @type {Integer (Int32)}
     */
    static SVPriority => 9

    /**
     * Native name: DISPID_SVAlertBoundary
     * @type {Integer (Int32)}
     */
    static SVAlertBoundary => 10

    /**
     * Native name: DISPID_SVSyncronousSpeakTimeout
     * @type {Integer (Int32)}
     */
    static SVSyncronousSpeakTimeout => 11

    /**
     * Native name: DISPID_SVSpeak
     * @type {Integer (Int32)}
     */
    static SVSpeak => 12

    /**
     * Native name: DISPID_SVSpeakStream
     * @type {Integer (Int32)}
     */
    static SVSpeakStream => 13

    /**
     * Native name: DISPID_SVPause
     * @type {Integer (Int32)}
     */
    static SVPause => 14

    /**
     * Native name: DISPID_SVResume
     * @type {Integer (Int32)}
     */
    static SVResume => 15

    /**
     * Native name: DISPID_SVSkip
     * @type {Integer (Int32)}
     */
    static SVSkip => 16

    /**
     * Native name: DISPID_SVGetVoices
     * @type {Integer (Int32)}
     */
    static SVGetVoices => 17

    /**
     * Native name: DISPID_SVGetAudioOutputs
     * @type {Integer (Int32)}
     */
    static SVGetAudioOutputs => 18

    /**
     * Native name: DISPID_SVWaitUntilDone
     * @type {Integer (Int32)}
     */
    static SVWaitUntilDone => 19

    /**
     * Native name: DISPID_SVSpeakCompleteEvent
     * @type {Integer (Int32)}
     */
    static SVSpeakCompleteEvent => 20

    /**
     * Native name: DISPID_SVIsUISupported
     * @type {Integer (Int32)}
     */
    static SVIsUISupported => 21

    /**
     * Native name: DISPID_SVDisplayUI
     * @type {Integer (Int32)}
     */
    static SVDisplayUI => 22
}
