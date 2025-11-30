#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechVoiceEvent extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEStreamStart => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEStreamEnd => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEVoiceChange => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEBookmark => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEWord => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEPhoneme => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVESentenceBoundary => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEViseme => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEAudioLevel => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEEnginePrivate => 10
}
