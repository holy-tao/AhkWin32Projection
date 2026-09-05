#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechAudioStatus extends Win32Enum {

    /**
     * Native name: DISPID_SASFreeBufferSpace
     * @type {Integer (Int32)}
     */
    static SASFreeBufferSpace => 1

    /**
     * Native name: DISPID_SASNonBlockingIO
     * @type {Integer (Int32)}
     */
    static SASNonBlockingIO => 2

    /**
     * Native name: DISPID_SASState
     * @type {Integer (Int32)}
     */
    static SASState => 3

    /**
     * Native name: DISPID_SASCurrentSeekPosition
     * @type {Integer (Int32)}
     */
    static SASCurrentSeekPosition => 4

    /**
     * Native name: DISPID_SASCurrentDevicePosition
     * @type {Integer (Int32)}
     */
    static SASCurrentDevicePosition => 5
}
