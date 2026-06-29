#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DESKBANDCID {
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
    static DBID_BANDINFOCHANGED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBID_SHOWONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBID_MAXIMIZEBAND => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBID_PUSHCHEVRON => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBID_DELAYINIT => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBID_FINISHINIT => 5

    /**
     * @type {Integer (Int32)}
     */
    static DBID_SETWINDOWTHEME => 6

    /**
     * @type {Integer (Int32)}
     */
    static DBID_PERMITAUTOHIDE => 7
}
