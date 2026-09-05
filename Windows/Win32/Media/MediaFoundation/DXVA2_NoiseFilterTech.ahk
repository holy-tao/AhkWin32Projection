#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA2_NoiseFilterTech extends Win32Enum {

    /**
     * Native name: DXVA2_NoiseFilterTech_Unsupported
     * @type {Integer (Int32)}
     */
    static Unsupported => 0

    /**
     * Native name: DXVA2_NoiseFilterTech_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 1

    /**
     * Native name: DXVA2_NoiseFilterTech_Median
     * @type {Integer (Int32)}
     */
    static Median => 2

    /**
     * Native name: DXVA2_NoiseFilterTech_Temporal
     * @type {Integer (Int32)}
     */
    static Temporal => 4

    /**
     * Native name: DXVA2_NoiseFilterTech_BlockNoise
     * @type {Integer (Int32)}
     */
    static BlockNoise => 8

    /**
     * Native name: DXVA2_NoiseFilterTech_MosquitoNoise
     * @type {Integer (Int32)}
     */
    static MosquitoNoise => 16

    /**
     * Native name: DXVA2_NoiseFilterTech_Mask
     * @type {Integer (Int32)}
     */
    static Mask => 31
}
