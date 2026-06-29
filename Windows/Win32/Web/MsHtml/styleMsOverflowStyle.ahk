#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleMsOverflowStyle {
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
    static styleMsOverflowStyleNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsOverflowStyleAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsOverflowStyleNone => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsOverflowStyleScrollbar => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleMsOverflowStyleMsAutoHidingScrollbar => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleMsOverflowStyle_Max => 2147483647
}
