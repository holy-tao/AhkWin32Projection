#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSMETHOD_BDA_GPNV_SERVICE {
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
    static KSMETHOD_BDA_GPNV_GETVALUE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_GPNV_SETVALUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_GPNV_NAMEFROMINDEX => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_GPNV_GETVALUEUPDATENAME => 3
}
