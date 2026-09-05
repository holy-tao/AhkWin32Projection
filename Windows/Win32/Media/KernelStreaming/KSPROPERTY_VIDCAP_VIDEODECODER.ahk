#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_VIDCAP_VIDEODECODER extends Win32Enum {

    /**
     * Native name: KSPROPERTY_VIDEODECODER_CAPS
     * @type {Integer (Int32)}
     */
    static CAPS => 0

    /**
     * Native name: KSPROPERTY_VIDEODECODER_STANDARD
     * @type {Integer (Int32)}
     */
    static STANDARD => 1

    /**
     * Native name: KSPROPERTY_VIDEODECODER_STATUS
     * @type {Integer (Int32)}
     */
    static STATUS => 2

    /**
     * Native name: KSPROPERTY_VIDEODECODER_OUTPUT_ENABLE
     * @type {Integer (Int32)}
     */
    static OUTPUT_ENABLE => 3

    /**
     * Native name: KSPROPERTY_VIDEODECODER_VCR_TIMING
     * @type {Integer (Int32)}
     */
    static VCR_TIMING => 4

    /**
     * Native name: KSPROPERTY_VIDEODECODER_STATUS2
     * @type {Integer (Int32)}
     */
    static STATUS2 => 5
}
