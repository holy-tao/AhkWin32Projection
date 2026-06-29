#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct COMBOBOX_EX_ITEM_FLAGS {
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
    static CBEIF_DI_SETITEM => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static CBEIF_IMAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CBEIF_INDENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CBEIF_LPARAM => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CBEIF_OVERLAY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CBEIF_SELECTEDIMAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CBEIF_TEXT => 1
}
