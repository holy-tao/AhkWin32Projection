#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct FRAMEOPTIONS_FLAGS {
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
    static FRAMEOPTIONS_SCROLL_YES => 1

    /**
     * @type {Integer (Int32)}
     */
    static FRAMEOPTIONS_SCROLL_NO => 2

    /**
     * @type {Integer (Int32)}
     */
    static FRAMEOPTIONS_SCROLL_AUTO => 4

    /**
     * @type {Integer (Int32)}
     */
    static FRAMEOPTIONS_NORESIZE => 8

    /**
     * @type {Integer (Int32)}
     */
    static FRAMEOPTIONS_NO3DBORDER => 16

    /**
     * @type {Integer (Int32)}
     */
    static FRAMEOPTIONS_DESKTOP => 32

    /**
     * @type {Integer (Int32)}
     */
    static FRAMEOPTIONS_BROWSERBAND => 64
}
