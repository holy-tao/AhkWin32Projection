#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AM_WST_STYLE enumeration is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/iwstdec/ne-iwstdec-am_wst_style
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_WST_STYLE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_WST_STYLE_None => 0

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_WST_STYLE_Invers => 1
}
