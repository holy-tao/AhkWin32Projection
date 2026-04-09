#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SpeechWordType extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SWTAdded => 1

    /**
     * @type {Integer (Int32)}
     */
    static SWTDeleted => 2
}
