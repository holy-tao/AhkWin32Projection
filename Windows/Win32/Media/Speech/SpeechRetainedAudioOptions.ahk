#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechRetainedAudioOptions extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SRAONone => 0

    /**
     * @type {Integer (Int32)}
     */
    static SRAORetainAudio => 1
}
