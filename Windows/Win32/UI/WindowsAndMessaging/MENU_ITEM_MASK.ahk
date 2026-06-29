#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MENU_ITEM_MASK {
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
    static MIIM_BITMAP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MIIM_CHECKMARKS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MIIM_DATA => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MIIM_FTYPE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MIIM_ID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MIIM_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MIIM_STRING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MIIM_SUBMENU => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MIIM_TYPE => 16
}
