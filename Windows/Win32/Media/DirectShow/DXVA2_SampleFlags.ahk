#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DXVA2_SampleFlags {
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
    static DXVA2_SampleFlag_Palette_Changed => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleFlag_SrcRect_Changed => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleFlag_DstRect_Changed => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleFlag_ColorData_Changed => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleFlag_PlanarAlpha_Changed => 16

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleFlag_RFF => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleFlag_TFF => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleFlag_RFF_TFF_Present => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleFlagsMask => -65505
}
