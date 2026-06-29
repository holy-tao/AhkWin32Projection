#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleVisibility {
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
    static styleVisibilityNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleVisibilityInherit => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleVisibilityVisible => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleVisibilityHidden => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleVisibilityCollapse => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleVisibility_Max => 2147483647
}
