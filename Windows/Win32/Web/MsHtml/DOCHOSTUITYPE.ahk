#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct DOCHOSTUITYPE {
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
    static DOCHOSTUITYPE_BROWSE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DOCHOSTUITYPE_AUTHOR => 1
}
