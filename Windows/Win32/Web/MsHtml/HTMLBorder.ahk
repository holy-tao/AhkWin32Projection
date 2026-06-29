#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct HTMLBorder {
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
    static HTMLBorderNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderThick => 262144

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderDialog => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderThin => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorder_Max => 2147483647
}
