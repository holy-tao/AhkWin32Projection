#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct WINDOW_LONG_PTR_INDEX {
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
    static GWL_EXSTYLE => -20

    /**
     * @type {Integer (Int32)}
     */
    static GWLP_HINSTANCE => -6

    /**
     * @type {Integer (Int32)}
     */
    static GWLP_HWNDPARENT => -8

    /**
     * @type {Integer (Int32)}
     */
    static GWLP_ID => -12

    /**
     * @type {Integer (Int32)}
     */
    static GWL_STYLE => -16

    /**
     * @type {Integer (Int32)}
     */
    static GWLP_USERDATA => -21

    /**
     * @type {Integer (Int32)}
     */
    static GWLP_WNDPROC => -4

    /**
     * @type {Integer (Int32)}
     */
    static GWL_HINSTANCE => -6

    /**
     * @type {Integer (Int32)}
     */
    static GWL_ID => -12

    /**
     * @type {Integer (Int32)}
     */
    static GWL_USERDATA => -21

    /**
     * @type {Integer (Int32)}
     */
    static GWL_WNDPROC => -4

    /**
     * @type {Integer (Int32)}
     */
    static GWL_HWNDPARENT => -8
}
