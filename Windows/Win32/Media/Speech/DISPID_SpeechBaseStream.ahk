#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechBaseStream extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SBSFormat => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SBSRead => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SBSWrite => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SBSSeek => 4
}
