#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LISTVIEWPARTS {
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
    static LVP_LISTITEM => 1

    /**
     * @type {Integer (Int32)}
     */
    static LVP_LISTGROUP => 2

    /**
     * @type {Integer (Int32)}
     */
    static LVP_LISTDETAIL => 3

    /**
     * @type {Integer (Int32)}
     */
    static LVP_LISTSORTEDDETAIL => 4

    /**
     * @type {Integer (Int32)}
     */
    static LVP_EMPTYTEXT => 5

    /**
     * @type {Integer (Int32)}
     */
    static LVP_GROUPHEADER => 6

    /**
     * @type {Integer (Int32)}
     */
    static LVP_GROUPHEADERLINE => 7

    /**
     * @type {Integer (Int32)}
     */
    static LVP_EXPANDBUTTON => 8

    /**
     * @type {Integer (Int32)}
     */
    static LVP_COLLAPSEBUTTON => 9

    /**
     * @type {Integer (Int32)}
     */
    static LVP_COLUMNDETAIL => 10
}
