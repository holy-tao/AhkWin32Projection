#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct _NSTCEHITTEST {
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
    static NSTCEHT_NOWHERE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_ONITEMICON => 2

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_ONITEMLABEL => 4

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_ONITEMINDENT => 8

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_ONITEMBUTTON => 16

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_ONITEMRIGHT => 32

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_ONITEMSTATEICON => 64

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_ONITEM => 70

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_ONITEMTABBUTTON => 4096
}
