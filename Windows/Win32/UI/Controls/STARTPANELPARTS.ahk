#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct STARTPANELPARTS {
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
    static SPP_USERPANE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPP_MOREPROGRAMS => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPP_MOREPROGRAMSARROW => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPP_PROGLIST => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPP_PROGLISTSEPARATOR => 5

    /**
     * @type {Integer (Int32)}
     */
    static SPP_PLACESLIST => 6

    /**
     * @type {Integer (Int32)}
     */
    static SPP_PLACESLISTSEPARATOR => 7

    /**
     * @type {Integer (Int32)}
     */
    static SPP_LOGOFF => 8

    /**
     * @type {Integer (Int32)}
     */
    static SPP_LOGOFFBUTTONS => 9

    /**
     * @type {Integer (Int32)}
     */
    static SPP_USERPICTURE => 10

    /**
     * @type {Integer (Int32)}
     */
    static SPP_PREVIEW => 11

    /**
     * @type {Integer (Int32)}
     */
    static SPP_MOREPROGRAMSTAB => 12

    /**
     * @type {Integer (Int32)}
     */
    static SPP_NSCHOST => 13

    /**
     * @type {Integer (Int32)}
     */
    static SPP_SOFTWAREEXPLORER => 14

    /**
     * @type {Integer (Int32)}
     */
    static SPP_OPENBOX => 15

    /**
     * @type {Integer (Int32)}
     */
    static SPP_SEARCHVIEW => 16

    /**
     * @type {Integer (Int32)}
     */
    static SPP_MOREPROGRAMSARROWBACK => 17

    /**
     * @type {Integer (Int32)}
     */
    static SPP_TOPMATCH => 18

    /**
     * @type {Integer (Int32)}
     */
    static SPP_LOGOFFSPLITBUTTONDROPDOWN => 19
}
