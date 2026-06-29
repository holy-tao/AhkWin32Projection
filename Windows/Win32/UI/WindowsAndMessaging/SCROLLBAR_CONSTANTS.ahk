#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct SCROLLBAR_CONSTANTS {
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
    static SB_CTL => 2

    /**
     * @type {Integer (Int32)}
     */
    static SB_HORZ => 0

    /**
     * @type {Integer (Int32)}
     */
    static SB_VERT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SB_BOTH => 3
}
