#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct HLNF {
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
    static HLNF_INTERNALJUMP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HLNF_OPENINNEWWINDOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HLNF_NAVIGATINGBACK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HLNF_NAVIGATINGFORWARD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HLNF_NAVIGATINGTOSTACKITEM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HLNF_CREATENOHISTORY => 32
}
