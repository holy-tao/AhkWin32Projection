#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DFM_MESSAGE_ID {
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
    static DFM_MERGECONTEXTMENU => 1

    /**
     * @type {Integer (Int32)}
     */
    static DFM_INVOKECOMMAND => 2

    /**
     * @type {Integer (Int32)}
     */
    static DFM_GETHELPTEXT => 5

    /**
     * @type {Integer (Int32)}
     */
    static DFM_WM_MEASUREITEM => 6

    /**
     * @type {Integer (Int32)}
     */
    static DFM_WM_DRAWITEM => 7

    /**
     * @type {Integer (Int32)}
     */
    static DFM_WM_INITMENUPOPUP => 8

    /**
     * @type {Integer (Int32)}
     */
    static DFM_VALIDATECMD => 9

    /**
     * @type {Integer (Int32)}
     */
    static DFM_MERGECONTEXTMENU_TOP => 10

    /**
     * @type {Integer (Int32)}
     */
    static DFM_GETHELPTEXTW => 11

    /**
     * @type {Integer (Int32)}
     */
    static DFM_INVOKECOMMANDEX => 12

    /**
     * @type {Integer (Int32)}
     */
    static DFM_MAPCOMMANDNAME => 13

    /**
     * @type {Integer (Int32)}
     */
    static DFM_GETDEFSTATICID => 14

    /**
     * @type {Integer (Int32)}
     */
    static DFM_GETVERBW => 15

    /**
     * @type {Integer (Int32)}
     */
    static DFM_GETVERBA => 16

    /**
     * @type {Integer (Int32)}
     */
    static DFM_MERGECONTEXTMENU_BOTTOM => 17

    /**
     * @type {Integer (Int32)}
     */
    static DFM_MODIFYQCMFLAGS => 18
}
