#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechAudioState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SASClosed => 0

    /**
     * @type {Integer (Int32)}
     */
    static SASStop => 1

    /**
     * @type {Integer (Int32)}
     */
    static SASPause => 2

    /**
     * @type {Integer (Int32)}
     */
    static SASRun => 3
}
