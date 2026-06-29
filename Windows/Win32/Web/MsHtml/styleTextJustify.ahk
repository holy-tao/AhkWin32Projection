#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleTextJustify {
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
    static styleTextJustifyNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyInterWord => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyNewspaper => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyDistribute => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyDistributeAllLines => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyInterIdeograph => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyInterCluster => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyKashida => 7

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyAuto => 8

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustify_Max => 2147483647
}
