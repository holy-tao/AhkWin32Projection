#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechVoiceEvents extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SVEStartInputStream => 2

    /**
     * @type {Integer (Int32)}
     */
    static SVEEndInputStream => 4

    /**
     * @type {Integer (Int32)}
     */
    static SVEVoiceChange => 8

    /**
     * @type {Integer (Int32)}
     */
    static SVEBookmark => 16

    /**
     * @type {Integer (Int32)}
     */
    static SVEWordBoundary => 32

    /**
     * @type {Integer (Int32)}
     */
    static SVEPhoneme => 64

    /**
     * @type {Integer (Int32)}
     */
    static SVESentenceBoundary => 128

    /**
     * @type {Integer (Int32)}
     */
    static SVEViseme => 256

    /**
     * @type {Integer (Int32)}
     */
    static SVEAudioLevel => 512

    /**
     * @type {Integer (Int32)}
     */
    static SVEPrivate => 32768

    /**
     * @type {Integer (Int32)}
     */
    static SVEAllEvents => 33790
}
