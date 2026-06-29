#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct MONTHCALPARTS {
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
    static MC_BACKGROUND => 1

    /**
     * @type {Integer (Int32)}
     */
    static MC_BORDERS => 2

    /**
     * @type {Integer (Int32)}
     */
    static MC_GRIDBACKGROUND => 3

    /**
     * @type {Integer (Int32)}
     */
    static MC_COLHEADERSPLITTER => 4

    /**
     * @type {Integer (Int32)}
     */
    static MC_GRIDCELLBACKGROUND => 5

    /**
     * @type {Integer (Int32)}
     */
    static MC_GRIDCELL => 6

    /**
     * @type {Integer (Int32)}
     */
    static MC_GRIDCELLUPPER => 7

    /**
     * @type {Integer (Int32)}
     */
    static MC_TRAILINGGRIDCELL => 8

    /**
     * @type {Integer (Int32)}
     */
    static MC_TRAILINGGRIDCELLUPPER => 9

    /**
     * @type {Integer (Int32)}
     */
    static MC_NAVNEXT => 10

    /**
     * @type {Integer (Int32)}
     */
    static MC_NAVPREV => 11
}
