#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechPhoneConverter extends Win32Enum {

    /**
     * Native name: DISPID_SPCLangId
     * @type {Integer (Int32)}
     */
    static SPCLangId => 1

    /**
     * Native name: DISPID_SPCPhoneToId
     * @type {Integer (Int32)}
     */
    static SPCPhoneToId => 2

    /**
     * Native name: DISPID_SPCIdToPhone
     * @type {Integer (Int32)}
     */
    static SPCIdToPhone => 3
}
