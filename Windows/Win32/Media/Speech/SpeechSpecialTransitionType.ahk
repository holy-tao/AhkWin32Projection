#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechSpecialTransitionType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SSTTWildcard => 1

    /**
     * @type {Integer (Int32)}
     */
    static SSTTDictation => 2

    /**
     * @type {Integer (Int32)}
     */
    static SSTTTextBuffer => 3
}
