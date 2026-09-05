#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_VIDCAP_VIDEOCOMPRESSION extends Win32Enum {

    /**
     * Native name: KSPROPERTY_VIDEOCOMPRESSION_GETINFO
     * @type {Integer (Int32)}
     */
    static GETINFO => 0

    /**
     * Native name: KSPROPERTY_VIDEOCOMPRESSION_KEYFRAME_RATE
     * @type {Integer (Int32)}
     */
    static KEYFRAME_RATE => 1

    /**
     * Native name: KSPROPERTY_VIDEOCOMPRESSION_PFRAMES_PER_KEYFRAME
     * @type {Integer (Int32)}
     */
    static PFRAMES_PER_KEYFRAME => 2

    /**
     * Native name: KSPROPERTY_VIDEOCOMPRESSION_QUALITY
     * @type {Integer (Int32)}
     */
    static QUALITY => 3

    /**
     * Native name: KSPROPERTY_VIDEOCOMPRESSION_OVERRIDE_KEYFRAME
     * @type {Integer (Int32)}
     */
    static OVERRIDE_KEYFRAME => 4

    /**
     * Native name: KSPROPERTY_VIDEOCOMPRESSION_OVERRIDE_FRAME_SIZE
     * @type {Integer (Int32)}
     */
    static OVERRIDE_FRAME_SIZE => 5

    /**
     * Native name: KSPROPERTY_VIDEOCOMPRESSION_WINDOWSIZE
     * @type {Integer (Int32)}
     */
    static WINDOWSIZE => 6
}
