#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TA_PROPERTY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static TAP_FLAGS => 0

    /**
     * @type {Integer (Int32)}
     */
    static TAP_TRANSFORMCOUNT => 1

    /**
     * @type {Integer (Int32)}
     */
    static TAP_STAGGERDELAY => 2

    /**
     * @type {Integer (Int32)}
     */
    static TAP_STAGGERDELAYCAP => 3

    /**
     * @type {Integer (Int32)}
     */
    static TAP_STAGGERDELAYFACTOR => 4

    /**
     * @type {Integer (Int32)}
     */
    static TAP_ZORDER => 5
}
