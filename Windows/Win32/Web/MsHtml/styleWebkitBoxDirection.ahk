#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleWebkitBoxDirection {
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
    static styleWebkitBoxDirectionNormal => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxDirectionReverse => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxDirectionNotSet => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxDirection_Max => 2147483647
}
