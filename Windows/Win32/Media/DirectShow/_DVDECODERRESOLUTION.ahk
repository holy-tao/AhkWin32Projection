#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct _DVDECODERRESOLUTION {
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
    static DVDECODERRESOLUTION_720x480 => 1000

    /**
     * @type {Integer (Int32)}
     */
    static DVDECODERRESOLUTION_360x240 => 1001

    /**
     * @type {Integer (Int32)}
     */
    static DVDECODERRESOLUTION_180x120 => 1002

    /**
     * @type {Integer (Int32)}
     */
    static DVDECODERRESOLUTION_88x60 => 1003
}
