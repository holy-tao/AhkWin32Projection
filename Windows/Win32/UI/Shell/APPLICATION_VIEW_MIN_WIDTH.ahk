#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct APPLICATION_VIEW_MIN_WIDTH {
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
    static AVMW_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static AVMW_320 => 1

    /**
     * @type {Integer (Int32)}
     */
    static AVMW_500 => 2
}
