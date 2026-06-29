#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the closed captioning state (on or off).
 * @see https://learn.microsoft.com/windows/win32/api/il21dec/ne-il21dec-am_line21_ccstate
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_LINE21_CCSTATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Closed captioning off.
     * @type {Integer (Int32)}
     */
    static AM_L21_CCSTATE_Off => 0

    /**
     * Closed captioning on.
     * @type {Integer (Int32)}
     */
    static AM_L21_CCSTATE_On => 1
}
