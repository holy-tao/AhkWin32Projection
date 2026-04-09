#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SpeechRunState extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SRSEDone => 1

    /**
     * @type {Integer (Int32)}
     */
    static SRSEIsSpeaking => 2
}
