#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMREBAR_MASK_FLAGS {
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
    static RBNM_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RBNM_LPARAM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RBNM_STYLE => 2
}
