#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_SampleFlags {
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
    static DXVA_SampleFlagsMask => 15

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_SampleFlag_Palette_Changed => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_SampleFlag_SrcRect_Changed => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_SampleFlag_DstRect_Changed => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_SampleFlag_ColorData_Changed => 8
}
