#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AM_WST_SERVICE enumeration is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/iwstdec/ne-iwstdec-am_wst_service
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_WST_SERVICE {
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
    static AM_WST_SERVICE_None => 0

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_WST_SERVICE_Text => 1

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_WST_SERVICE_IDS => 2

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_WST_SERVICE_Invalid => 3
}
