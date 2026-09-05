#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechFileStream extends Win32Enum {

    /**
     * Native name: DISPID_SFSOpen
     * @type {Integer (Int32)}
     */
    static SFSOpen => 100

    /**
     * Native name: DISPID_SFSClose
     * @type {Integer (Int32)}
     */
    static SFSClose => 101
}
