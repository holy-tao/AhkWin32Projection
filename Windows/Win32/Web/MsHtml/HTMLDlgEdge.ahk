#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct HTMLDlgEdge {
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
    static HTMLDlgEdgeSunken => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLDlgEdgeRaised => 16

    /**
     * @type {Integer (Int32)}
     */
    static HTMLDlgEdge_Max => 2147483647
}
