#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MENU_ITEM_TYPE {
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
    static MFT_BITMAP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_MENUBARBREAK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_MENUBREAK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_OWNERDRAW => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_RADIOCHECK => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_RIGHTJUSTIFY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_RIGHTORDER => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_SEPARATOR => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_STRING => 0
}
