#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TBBUTTONINFOW_MASK {
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
    static TBIF_BYINDEX => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static TBIF_COMMAND => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TBIF_IMAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TBIF_LPARAM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TBIF_SIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TBIF_STATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TBIF_STYLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TBIF_TEXT => 2
}
