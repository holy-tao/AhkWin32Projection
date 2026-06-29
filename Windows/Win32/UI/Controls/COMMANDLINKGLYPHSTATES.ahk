#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct COMMANDLINKGLYPHSTATES {
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
    static CMDLGS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static CMDLGS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static CMDLGS_PRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static CMDLGS_DISABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static CMDLGS_DEFAULTED => 5
}
