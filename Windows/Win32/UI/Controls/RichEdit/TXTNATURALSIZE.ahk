#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct TXTNATURALSIZE {
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
    static TXTNS_FITTOCONTENT2 => 0

    /**
     * @type {Integer (Int32)}
     */
    static TXTNS_FITTOCONTENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static TXTNS_ROUNDTOLINE => 2

    /**
     * @type {Integer (Int32)}
     */
    static TXTNS_FITTOCONTENT3 => 3

    /**
     * @type {Integer (Int32)}
     */
    static TXTNS_FITTOCONTENTWSP => 4

    /**
     * @type {Integer (Int32)}
     */
    static TXTNS_INCLUDELASTLINE => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static TXTNS_EMU => -2147483648
}
