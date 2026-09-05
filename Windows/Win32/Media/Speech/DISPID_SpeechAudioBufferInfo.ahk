#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechAudioBufferInfo extends Win32Enum {

    /**
     * Native name: DISPID_SABIMinNotification
     * @type {Integer (Int32)}
     */
    static SABIMinNotification => 1

    /**
     * Native name: DISPID_SABIBufferSize
     * @type {Integer (Int32)}
     */
    static SABIBufferSize => 2

    /**
     * Native name: DISPID_SABIEventBias
     * @type {Integer (Int32)}
     */
    static SABIEventBias => 3
}
