#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechMemoryStream extends Win32Enum {

    /**
     * Native name: DISPID_SMSSetData
     * @type {Integer (Int32)}
     */
    static SMSSetData => 100

    /**
     * Native name: DISPID_SMSGetData
     * @type {Integer (Int32)}
     */
    static SMSGetData => 101
}
