#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAV1EncoderOperatingMode extends Win32Enum {

    /**
     * Native name: eAV1EncoderOperatingMode_Auto
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Native name: eAV1EncoderOperatingMode_Reference
     * @type {Integer (Int32)}
     */
    static Reference => 1

    /**
     * Native name: eAV1EncoderOperatingMode_Optimized
     * @type {Integer (Int32)}
     */
    static Optimized => 2
}
