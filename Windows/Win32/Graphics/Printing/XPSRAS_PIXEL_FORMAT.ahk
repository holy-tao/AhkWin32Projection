#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct XPSRAS_PIXEL_FORMAT {
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
    static XPSRAS_PIXEL_FORMAT_32BPP_PBGRA_UINT_SRGB => 1

    /**
     * @type {Integer (Int32)}
     */
    static XPSRAS_PIXEL_FORMAT_64BPP_PRGBA_HALF_SCRGB => 2

    /**
     * @type {Integer (Int32)}
     */
    static XPSRAS_PIXEL_FORMAT_128BPP_PRGBA_FLOAT_SCRGB => 3
}
