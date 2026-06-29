#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleWidowsOrphans {
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
    static styleWidowsOrphansNotSet => -2147483647

    /**
     * @type {Integer (Int32)}
     */
    static styleWidowsOrphans_Max => 2147483647
}
