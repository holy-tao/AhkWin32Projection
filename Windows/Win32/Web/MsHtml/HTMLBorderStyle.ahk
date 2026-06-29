#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct HTMLBorderStyle {
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
    static HTMLBorderStyleNormal => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderStyleRaised => 256

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderStyleSunken => 512

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderStylecombined => 768

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderStyleStatic => 131072

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderStyle_Max => 2147483647
}
