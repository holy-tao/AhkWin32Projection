#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechWaveFormatEx extends Win32Enum {

    /**
     * Native name: DISPID_SWFEFormatTag
     * @type {Integer (Int32)}
     */
    static SWFEFormatTag => 1

    /**
     * Native name: DISPID_SWFEChannels
     * @type {Integer (Int32)}
     */
    static SWFEChannels => 2

    /**
     * Native name: DISPID_SWFESamplesPerSec
     * @type {Integer (Int32)}
     */
    static SWFESamplesPerSec => 3

    /**
     * Native name: DISPID_SWFEAvgBytesPerSec
     * @type {Integer (Int32)}
     */
    static SWFEAvgBytesPerSec => 4

    /**
     * Native name: DISPID_SWFEBlockAlign
     * @type {Integer (Int32)}
     */
    static SWFEBlockAlign => 5

    /**
     * Native name: DISPID_SWFEBitsPerSample
     * @type {Integer (Int32)}
     */
    static SWFEBitsPerSample => 6

    /**
     * Native name: DISPID_SWFEExtraData
     * @type {Integer (Int32)}
     */
    static SWFEExtraData => 7
}
