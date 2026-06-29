#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AM_WST_DRAWBGMODE enumeration specifies whether the background of the WST frame is opaque or transparent.
 * @see https://learn.microsoft.com/windows/win32/api/iwstdec/ne-iwstdec-am_wst_drawbgmode
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_WST_DRAWBGMODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The background is opaque.
     * @type {Integer (Int32)}
     */
    static AM_WST_DRAWBGMODE_Opaque => 0

    /**
     * The background is transparent.
     * @type {Integer (Int32)}
     */
    static AM_WST_DRAWBGMODE_Transparent => 1
}
