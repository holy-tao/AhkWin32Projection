#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_VIDCAP_VIDEODECODER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEODECODER_CAPS => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEODECODER_STANDARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEODECODER_STATUS => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEODECODER_OUTPUT_ENABLE => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEODECODER_VCR_TIMING => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEODECODER_STATUS2 => 5
}
