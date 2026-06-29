#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct SCROLLABLECONTEXTMENU_PLACEMENT {
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
    static SCMP_TOP => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCMP_BOTTOM => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCMP_LEFT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCMP_RIGHT => 3

    /**
     * @type {Integer (Int32)}
     */
    static SCMP_FULL => 4
}
