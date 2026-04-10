#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SpeechStreamSeekPositionType extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static SSSPTRelativeToStart => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SSSPTRelativeToCurrentPosition => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SSSPTRelativeToEnd => 2
}
