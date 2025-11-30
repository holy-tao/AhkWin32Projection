#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechVisemeFeature extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SVF_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVF_Stressed => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVF_Emphasis => 2
}
