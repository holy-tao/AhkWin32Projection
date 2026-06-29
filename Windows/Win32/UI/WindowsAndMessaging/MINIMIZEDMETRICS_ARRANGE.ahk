#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MINIMIZEDMETRICS_ARRANGE {
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
    static ARW_BOTTOMLEFT => 0

    /**
     * @type {Integer (Int32)}
     */
    static ARW_BOTTOMRIGHT => 1

    /**
     * @type {Integer (Int32)}
     */
    static ARW_TOPLEFT => 2

    /**
     * @type {Integer (Int32)}
     */
    static ARW_TOPRIGHT => 3
}
