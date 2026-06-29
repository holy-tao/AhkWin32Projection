#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct stylePageBreak {
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
    static stylePageBreakNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static stylePageBreakAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static stylePageBreakAlways => 2

    /**
     * @type {Integer (Int32)}
     */
    static stylePageBreakLeft => 3

    /**
     * @type {Integer (Int32)}
     */
    static stylePageBreakRight => 4

    /**
     * @type {Integer (Int32)}
     */
    static stylePageBreakAvoid => 5

    /**
     * @type {Integer (Int32)}
     */
    static stylePageBreak_Max => 2147483647
}
