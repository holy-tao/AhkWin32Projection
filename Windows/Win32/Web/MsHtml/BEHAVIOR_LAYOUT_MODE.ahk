#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct BEHAVIOR_LAYOUT_MODE {
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
    static BEHAVIORLAYOUTMODE_NATURAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORLAYOUTMODE_MINWIDTH => 2

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORLAYOUTMODE_MAXWIDTH => 4

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORLAYOUTMODE_MEDIA_RESOLUTION => 16384

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORLAYOUTMODE_FINAL_PERCENT => 32768

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_LAYOUT_MODE_Max => 2147483647
}
