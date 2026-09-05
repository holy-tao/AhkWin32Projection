#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechRecognizer extends Win32Enum {

    /**
     * Native name: DISPID_SRRecognizer
     * @type {Integer (Int32)}
     */
    static SRRecognizer => 1

    /**
     * Native name: DISPID_SRAllowAudioInputFormatChangesOnNextSet
     * @type {Integer (Int32)}
     */
    static SRAllowAudioInputFormatChangesOnNextSet => 2

    /**
     * Native name: DISPID_SRAudioInput
     * @type {Integer (Int32)}
     */
    static SRAudioInput => 3

    /**
     * Native name: DISPID_SRAudioInputStream
     * @type {Integer (Int32)}
     */
    static SRAudioInputStream => 4

    /**
     * Native name: DISPID_SRIsShared
     * @type {Integer (Int32)}
     */
    static SRIsShared => 5

    /**
     * Native name: DISPID_SRState
     * @type {Integer (Int32)}
     */
    static SRState => 6

    /**
     * Native name: DISPID_SRStatus
     * @type {Integer (Int32)}
     */
    static SRStatus => 7

    /**
     * Native name: DISPID_SRProfile
     * @type {Integer (Int32)}
     */
    static SRProfile => 8

    /**
     * Native name: DISPID_SREmulateRecognition
     * @type {Integer (Int32)}
     */
    static SREmulateRecognition => 9

    /**
     * Native name: DISPID_SRCreateRecoContext
     * @type {Integer (Int32)}
     */
    static SRCreateRecoContext => 10

    /**
     * Native name: DISPID_SRGetFormat
     * @type {Integer (Int32)}
     */
    static SRGetFormat => 11

    /**
     * Native name: DISPID_SRSetPropertyNumber
     * @type {Integer (Int32)}
     */
    static SRSetPropertyNumber => 12

    /**
     * Native name: DISPID_SRGetPropertyNumber
     * @type {Integer (Int32)}
     */
    static SRGetPropertyNumber => 13

    /**
     * Native name: DISPID_SRSetPropertyString
     * @type {Integer (Int32)}
     */
    static SRSetPropertyString => 14

    /**
     * Native name: DISPID_SRGetPropertyString
     * @type {Integer (Int32)}
     */
    static SRGetPropertyString => 15

    /**
     * Native name: DISPID_SRIsUISupported
     * @type {Integer (Int32)}
     */
    static SRIsUISupported => 16

    /**
     * Native name: DISPID_SRDisplayUI
     * @type {Integer (Int32)}
     */
    static SRDisplayUI => 17

    /**
     * Native name: DISPID_SRGetRecognizers
     * @type {Integer (Int32)}
     */
    static SRGetRecognizers => 18

    /**
     * Native name: DISPID_SVGetAudioInputs
     * @type {Integer (Int32)}
     */
    static SVGetAudioInputs => 19

    /**
     * Native name: DISPID_SVGetProfiles
     * @type {Integer (Int32)}
     */
    static SVGetProfiles => 20
}
