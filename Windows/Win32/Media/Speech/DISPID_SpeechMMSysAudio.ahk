#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechMMSysAudio extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SMSADeviceId => 300

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SMSALineId => 301

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SMSAMMHandle => 302
}
