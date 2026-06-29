#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AM_WST_STATE enumeration specifies whether WST closed captioning is enabled or disabled.
 * @see https://learn.microsoft.com/windows/win32/api/iwstdec/ne-iwstdec-am_wst_state
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_WST_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies that WST closed captioning is enabled.
     * @type {Integer (Int32)}
     */
    static AM_WST_STATE_Off => 0

    /**
     * Specifies that WST closed captioning is disabled.
     * @type {Integer (Int32)}
     */
    static AM_WST_STATE_On => 1
}
