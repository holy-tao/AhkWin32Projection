#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the closed captioning text background mode.
 * @see https://learn.microsoft.com/windows/win32/api/il21dec/ne-il21dec-am_line21_drawbgmode
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_LINE21_DRAWBGMODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Opaque background.
     * @type {Integer (Int32)}
     */
    static AM_L21_DRAWBGMODE_Opaque => 0

    /**
     * Transparent background.
     * @type {Integer (Int32)}
     */
    static AM_L21_DRAWBGMODE_Transparent => 1
}
