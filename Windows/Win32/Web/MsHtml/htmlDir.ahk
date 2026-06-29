#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlDir {
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
    static htmlDirNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlDirLeftToRight => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlDirRightToLeft => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlDir_Max => 2147483647
}
