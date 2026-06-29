#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMLVCUSTOMDRAW_ITEM_TYPE {
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
    static LVCDI_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LVCDI_GROUP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVCDI_ITEMSLIST => 2
}
