#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct _OPPROGDLGF {
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
    static OPPROGDLG_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static OPPROGDLG_ENABLEPAUSE => 128

    /**
     * @type {Integer (Int32)}
     */
    static OPPROGDLG_ALLOWUNDO => 256

    /**
     * @type {Integer (Int32)}
     */
    static OPPROGDLG_DONTDISPLAYSOURCEPATH => 512

    /**
     * @type {Integer (Int32)}
     */
    static OPPROGDLG_DONTDISPLAYDESTPATH => 1024

    /**
     * @type {Integer (Int32)}
     */
    static OPPROGDLG_NOMULTIDAYESTIMATES => 2048

    /**
     * @type {Integer (Int32)}
     */
    static OPPROGDLG_DONTDISPLAYLOCATIONS => 4096
}
