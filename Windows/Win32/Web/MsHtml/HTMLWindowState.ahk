#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct HTMLWindowState {
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
    static HTMLWindowStateNormal => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTMLWindowStateMaximize => 3

    /**
     * @type {Integer (Int32)}
     */
    static HTMLWindowStateMinimize => 6

    /**
     * @type {Integer (Int32)}
     */
    static HTMLWindowState_Max => 2147483647
}
