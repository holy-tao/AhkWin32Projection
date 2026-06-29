#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct SHOW_WINDOW_STATUS {
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
    static SW_PARENTCLOSING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SW_OTHERZOOM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SW_PARENTOPENING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SW_OTHERUNZOOM => 4
}
