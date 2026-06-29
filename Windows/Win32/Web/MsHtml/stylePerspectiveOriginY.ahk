#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct stylePerspectiveOriginY {
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
    static stylePerspectiveOriginYNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static stylePerspectiveOriginYTop => 1

    /**
     * @type {Integer (Int32)}
     */
    static stylePerspectiveOriginYCenter => 2

    /**
     * @type {Integer (Int32)}
     */
    static stylePerspectiveOriginYBottom => 3

    /**
     * @type {Integer (Int32)}
     */
    static stylePerspectiveOriginY_Max => 2147483647
}
