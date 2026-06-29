#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleTransformOriginY {
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
    static styleTransformOriginYNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleTransformOriginYTop => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleTransformOriginYCenter => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleTransformOriginYBottom => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleTransformOriginY_Max => 2147483647
}
