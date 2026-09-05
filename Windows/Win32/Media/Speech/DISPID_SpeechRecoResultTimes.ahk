#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechRecoResultTimes extends Win32Enum {

    /**
     * Native name: DISPID_SRRTStreamTime
     * @type {Integer (Int32)}
     */
    static SRRTStreamTime => 1

    /**
     * Native name: DISPID_SRRTLength
     * @type {Integer (Int32)}
     */
    static SRRTLength => 2

    /**
     * Native name: DISPID_SRRTTickCount
     * @type {Integer (Int32)}
     */
    static SRRTTickCount => 3

    /**
     * Native name: DISPID_SRRTOffsetFromStart
     * @type {Integer (Int32)}
     */
    static SRRTOffsetFromStart => 4
}
