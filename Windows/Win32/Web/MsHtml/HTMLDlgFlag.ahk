#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct HTMLDlgFlag {
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
    static HTMLDlgFlagNo => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLDlgFlagOff => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLDlgFlag0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLDlgFlagYes => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTMLDlgFlagOn => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTMLDlgFlag1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTMLDlgFlagNotSet => -1

    /**
     * @type {Integer (Int32)}
     */
    static HTMLDlgFlag_Max => 2147483647
}
