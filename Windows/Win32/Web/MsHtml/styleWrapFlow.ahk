#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleWrapFlow {
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
    static styleWrapFlowNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlowAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlowBoth => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlowStart => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlowEnd => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlowClear => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlowMinimum => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlowMaximum => 7

    /**
     * @type {Integer (Int32)}
     */
    static styleWrapFlow_Max => 2147483647
}
