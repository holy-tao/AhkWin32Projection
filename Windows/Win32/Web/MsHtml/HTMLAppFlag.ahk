#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct HTMLAppFlag {
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
    static HTMLAppFlagNo => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLAppFlagOff => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLAppFlag0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLAppFlagYes => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTMLAppFlagOn => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTMLAppFlag1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTMLAppFlag_Max => 2147483647
}
