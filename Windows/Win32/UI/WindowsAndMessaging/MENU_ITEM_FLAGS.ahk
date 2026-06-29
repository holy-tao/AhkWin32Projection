#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MENU_ITEM_FLAGS {
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
    static MF_BYCOMMAND => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MF_BYPOSITION => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MF_BITMAP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MF_CHECKED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MF_DISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MF_ENABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MF_GRAYED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MF_MENUBARBREAK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MF_MENUBREAK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MF_OWNERDRAW => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MF_POPUP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MF_SEPARATOR => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MF_STRING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MF_UNCHECKED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MF_INSERT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MF_CHANGE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MF_APPEND => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MF_DELETE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MF_REMOVE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MF_USECHECKBITMAPS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MF_UNHILITE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MF_HILITE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MF_DEFAULT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MF_SYSMENU => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MF_HELP => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MF_RIGHTJUSTIFY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MF_MOUSESELECT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MF_END => 128
}
