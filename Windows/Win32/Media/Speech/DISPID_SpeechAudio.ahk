#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechAudio extends Win32Enum {

    /**
     * Native name: DISPID_SAStatus
     * @type {Integer (Int32)}
     */
    static SAStatus => 200

    /**
     * Native name: DISPID_SABufferInfo
     * @type {Integer (Int32)}
     */
    static SABufferInfo => 201

    /**
     * Native name: DISPID_SADefaultFormat
     * @type {Integer (Int32)}
     */
    static SADefaultFormat => 202

    /**
     * Native name: DISPID_SAVolume
     * @type {Integer (Int32)}
     */
    static SAVolume => 203

    /**
     * Native name: DISPID_SABufferNotifySize
     * @type {Integer (Int32)}
     */
    static SABufferNotifySize => 204

    /**
     * Native name: DISPID_SAEventHandle
     * @type {Integer (Int32)}
     */
    static SAEventHandle => 205

    /**
     * Native name: DISPID_SASetState
     * @type {Integer (Int32)}
     */
    static SASetState => 206
}
