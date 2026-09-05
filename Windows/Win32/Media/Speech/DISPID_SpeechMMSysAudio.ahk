#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechMMSysAudio extends Win32Enum {

    /**
     * Native name: DISPID_SMSADeviceId
     * @type {Integer (Int32)}
     */
    static SMSADeviceId => 300

    /**
     * Native name: DISPID_SMSALineId
     * @type {Integer (Int32)}
     */
    static SMSALineId => 301

    /**
     * Native name: DISPID_SMSAMMHandle
     * @type {Integer (Int32)}
     */
    static SMSAMMHandle => 302
}
