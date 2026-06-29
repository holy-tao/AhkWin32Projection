#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 */
export default struct HH_GPROPID {
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
    static HH_GPROPID_SINGLETHREAD => 1

    /**
     * @type {Integer (Int32)}
     */
    static HH_GPROPID_TOOLBAR_MARGIN => 2

    /**
     * @type {Integer (Int32)}
     */
    static HH_GPROPID_UI_LANGUAGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static HH_GPROPID_CURRENT_SUBSET => 4

    /**
     * @type {Integer (Int32)}
     */
    static HH_GPROPID_CONTENT_LANGUAGE => 5
}
