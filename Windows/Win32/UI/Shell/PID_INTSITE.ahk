#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct PID_INTSITE {
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
    static PID_INTSITE_WHATSNEW => 2

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_AUTHOR => 3

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_LASTVISIT => 4

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_LASTMOD => 5

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_VISITCOUNT => 6

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_DESCRIPTION => 7

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_COMMENT => 8

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_FLAGS => 9

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_CONTENTLEN => 10

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_CONTENTCODE => 11

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_RECURSE => 12

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_WATCH => 13

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_SUBSCRIPTION => 14

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_URL => 15

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_TITLE => 16

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_CODEPAGE => 18

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_TRACKING => 19

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_ICONINDEX => 20

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_ICONFILE => 21

    /**
     * @type {Integer (Int32)}
     */
    static PID_INTSITE_ROAMED => 34
}
