#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_NoiseFilterTech{

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterTech_Unsupported => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterTech_Unknown => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterTech_Median => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterTech_Temporal => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterTech_BlockNoise => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterTech_MosquitoNoise => 16

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterTech_Mask => 31
}
