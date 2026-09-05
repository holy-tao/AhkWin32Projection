#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechVoiceEvent extends Win32Enum {

    /**
     * Native name: DISPID_SVEStreamStart
     * @type {Integer (Int32)}
     */
    static SVEStreamStart => 1

    /**
     * Native name: DISPID_SVEStreamEnd
     * @type {Integer (Int32)}
     */
    static SVEStreamEnd => 2

    /**
     * Native name: DISPID_SVEVoiceChange
     * @type {Integer (Int32)}
     */
    static SVEVoiceChange => 3

    /**
     * Native name: DISPID_SVEBookmark
     * @type {Integer (Int32)}
     */
    static SVEBookmark => 4

    /**
     * Native name: DISPID_SVEWord
     * @type {Integer (Int32)}
     */
    static SVEWord => 5

    /**
     * Native name: DISPID_SVEPhoneme
     * @type {Integer (Int32)}
     */
    static SVEPhoneme => 6

    /**
     * Native name: DISPID_SVESentenceBoundary
     * @type {Integer (Int32)}
     */
    static SVESentenceBoundary => 7

    /**
     * Native name: DISPID_SVEViseme
     * @type {Integer (Int32)}
     */
    static SVEViseme => 8

    /**
     * Native name: DISPID_SVEAudioLevel
     * @type {Integer (Int32)}
     */
    static SVEAudioLevel => 9

    /**
     * Native name: DISPID_SVEEnginePrivate
     * @type {Integer (Int32)}
     */
    static SVEEnginePrivate => 10
}
