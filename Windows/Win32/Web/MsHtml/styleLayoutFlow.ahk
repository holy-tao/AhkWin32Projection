#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleLayoutFlow {
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
    static styleLayoutFlowHorizontal => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutFlowVerticalIdeographic => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutFlowNotSet => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutFlow_Max => 2147483647
}
