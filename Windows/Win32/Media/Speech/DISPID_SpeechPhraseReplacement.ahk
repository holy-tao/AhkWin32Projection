#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechPhraseReplacement extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRDisplayAttributes => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRText => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRFirstElement => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRNumberOfElements => 4
}
