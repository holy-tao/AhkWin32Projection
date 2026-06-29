#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_NoiseFilterTech {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
