#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TASKDIALOGPARTS {
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
    static TDLG_PRIMARYPANEL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_MAININSTRUCTIONPANE => 2

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_MAINICON => 3

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_CONTENTPANE => 4

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_CONTENTICON => 5

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_EXPANDEDCONTENT => 6

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_COMMANDLINKPANE => 7

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_SECONDARYPANEL => 8

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_CONTROLPANE => 9

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_BUTTONSECTION => 10

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_BUTTONWRAPPER => 11

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_EXPANDOTEXT => 12

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_EXPANDOBUTTON => 13

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_VERIFICATIONTEXT => 14

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_FOOTNOTEPANE => 15

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_FOOTNOTEAREA => 16

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_FOOTNOTESEPARATOR => 17

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_EXPANDEDFOOTERAREA => 18

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_PROGRESSBAR => 19

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_IMAGEALIGNMENT => 20

    /**
     * @type {Integer (Int32)}
     */
    static TDLG_RADIOBUTTONPANE => 21
}
