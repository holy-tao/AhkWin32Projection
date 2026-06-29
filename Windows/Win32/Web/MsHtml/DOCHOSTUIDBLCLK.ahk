#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct DOCHOSTUIDBLCLK {
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
    static DOCHOSTUIDBLCLK_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIDBLCLK_SHOWPROPERTIES => 1

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUIDBLCLK_SHOWCODE => 2
}
