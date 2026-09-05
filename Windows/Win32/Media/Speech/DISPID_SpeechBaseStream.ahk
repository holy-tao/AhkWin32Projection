#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechBaseStream extends Win32Enum {

    /**
     * Native name: DISPID_SBSFormat
     * @type {Integer (Int32)}
     */
    static SBSFormat => 1

    /**
     * Native name: DISPID_SBSRead
     * @type {Integer (Int32)}
     */
    static SBSRead => 2

    /**
     * Native name: DISPID_SBSWrite
     * @type {Integer (Int32)}
     */
    static SBSWrite => 3

    /**
     * Native name: DISPID_SBSSeek
     * @type {Integer (Int32)}
     */
    static SBSSeek => 4
}
