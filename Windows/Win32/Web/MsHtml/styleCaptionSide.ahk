#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleCaptionSide {
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
    static styleCaptionSideNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleCaptionSideTop => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleCaptionSideBottom => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleCaptionSideLeft => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleCaptionSideRight => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleCaptionSide_Max => 2147483647
}
