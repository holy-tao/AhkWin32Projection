#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleWebkitBoxOrient {
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
    static styleWebkitBoxOrientHorizontal => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxOrientInlineAxis => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxOrientVertical => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxOrientBlockAxis => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxOrientNotSet => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxOrient_Max => 2147483647
}
