#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_ProcAmpControlProp {
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
    static DXVA_ProcAmp_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_ProcAmp_Brightness => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_ProcAmp_Contrast => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_ProcAmp_Hue => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_ProcAmp_Saturation => 8
}
