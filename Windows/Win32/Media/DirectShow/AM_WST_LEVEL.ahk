#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AM_WST_LEVEL enumeration is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/iwstdec/ne-iwstdec-am_wst_level
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_WST_LEVEL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static AM_WST_LEVEL_1_5 => 0
}
