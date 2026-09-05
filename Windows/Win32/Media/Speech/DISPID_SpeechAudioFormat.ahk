#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechAudioFormat extends Win32Enum {

    /**
     * Native name: DISPID_SAFType
     * @type {Integer (Int32)}
     */
    static SAFType => 1

    /**
     * Native name: DISPID_SAFGuid
     * @type {Integer (Int32)}
     */
    static SAFGuid => 2

    /**
     * Native name: DISPID_SAFGetWaveFormatEx
     * @type {Integer (Int32)}
     */
    static SAFGetWaveFormatEx => 3

    /**
     * Native name: DISPID_SAFSetWaveFormatEx
     * @type {Integer (Int32)}
     */
    static SAFSetWaveFormatEx => 4
}
