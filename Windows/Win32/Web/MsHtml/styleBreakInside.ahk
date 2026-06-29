#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleBreakInside {
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
    static styleBreakInsideNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakInsideAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakInsideAvoid => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakInsideAvoidPage => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakInsideAvoidColumn => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakInside_Max => 2147483647
}
