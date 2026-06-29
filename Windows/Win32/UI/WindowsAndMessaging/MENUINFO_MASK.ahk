#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MENUINFO_MASK {
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
    static MIM_APPLYTOSUBMENUS => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static MIM_BACKGROUND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MIM_HELPID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MIM_MAXHEIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MIM_MENUDATA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MIM_STYLE => 16
}
