#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMTBDISPINFOW_MASK {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static TBNF_IMAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TBNF_TEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TBNF_DI_SETITEM => 268435456
}
