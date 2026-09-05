#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechPhraseReplacement extends Win32Enum {

    /**
     * Native name: DISPID_SPRDisplayAttributes
     * @type {Integer (Int32)}
     */
    static SPRDisplayAttributes => 1

    /**
     * Native name: DISPID_SPRText
     * @type {Integer (Int32)}
     */
    static SPRText => 2

    /**
     * Native name: DISPID_SPRFirstElement
     * @type {Integer (Int32)}
     */
    static SPRFirstElement => 3

    /**
     * Native name: DISPID_SPRNumberOfElements
     * @type {Integer (Int32)}
     */
    static SPRNumberOfElements => 4
}
