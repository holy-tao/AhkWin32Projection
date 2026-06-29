#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct MENUPOPUPSELECT {
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
    static MPOS_EXECUTE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MPOS_FULLCANCEL => 1

    /**
     * @type {Integer (Int32)}
     */
    static MPOS_CANCELLEVEL => 2

    /**
     * @type {Integer (Int32)}
     */
    static MPOS_SELECTLEFT => 3

    /**
     * @type {Integer (Int32)}
     */
    static MPOS_SELECTRIGHT => 4

    /**
     * @type {Integer (Int32)}
     */
    static MPOS_CHILDTRACKING => 5
}
