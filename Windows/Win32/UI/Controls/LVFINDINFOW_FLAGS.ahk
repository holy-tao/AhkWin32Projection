#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LVFINDINFOW_FLAGS {
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
    static LVFI_PARAM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVFI_PARTIAL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LVFI_STRING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LVFI_SUBSTRING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LVFI_WRAP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LVFI_NEARESTXY => 64
}
