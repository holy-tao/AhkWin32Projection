#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_VIDCAP_VIDEOCOMPRESSION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOCOMPRESSION_GETINFO => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOCOMPRESSION_KEYFRAME_RATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOCOMPRESSION_PFRAMES_PER_KEYFRAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOCOMPRESSION_QUALITY => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOCOMPRESSION_OVERRIDE_KEYFRAME => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOCOMPRESSION_OVERRIDE_FRAME_SIZE => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOCOMPRESSION_WINDOWSIZE => 6
}
