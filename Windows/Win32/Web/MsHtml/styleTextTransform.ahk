#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleTextTransform {
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
    static styleTextTransformNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleTextTransformCapitalize => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleTextTransformLowercase => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleTextTransformUppercase => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleTextTransformNone => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleTextTransform_Max => 2147483647
}
