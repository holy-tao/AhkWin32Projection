#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct INITCOMMONCONTROLSEX_ICC {
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
    static ICC_ANIMATE_CLASS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ICC_BAR_CLASSES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ICC_COOL_CLASSES => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ICC_DATE_CLASSES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ICC_HOTKEY_CLASS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ICC_INTERNET_CLASSES => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ICC_LINK_CLASS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ICC_LISTVIEW_CLASSES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ICC_NATIVEFNTCTL_CLASS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static ICC_PAGESCROLLER_CLASS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ICC_PROGRESS_CLASS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ICC_STANDARD_CLASSES => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static ICC_TAB_CLASSES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ICC_TREEVIEW_CLASSES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ICC_UPDOWN_CLASS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ICC_USEREX_CLASSES => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ICC_WIN95_CLASSES => 255
}
