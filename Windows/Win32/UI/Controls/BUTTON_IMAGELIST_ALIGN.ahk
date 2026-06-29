#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct BUTTON_IMAGELIST_ALIGN {
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
    static BUTTON_IMAGELIST_ALIGN_LEFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_IMAGELIST_ALIGN_RIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_IMAGELIST_ALIGN_TOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_IMAGELIST_ALIGN_BOTTOM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_IMAGELIST_ALIGN_CENTER => 4
}
