#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SFVM_MESSAGE_ID {
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
    static SFVM_MERGEMENU => 1

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_INVOKECOMMAND => 2

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_GETHELPTEXT => 3

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_GETTOOLTIPTEXT => 4

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_GETBUTTONINFO => 5

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_GETBUTTONS => 6

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_INITMENUPOPUP => 7

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_FSNOTIFY => 14

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_WINDOWCREATED => 15

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_GETDETAILSOF => 23

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_COLUMNCLICK => 24

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_QUERYFSNOTIFY => 25

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_DEFITEMCOUNT => 26

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_DEFVIEWMODE => 27

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_UNMERGEMENU => 28

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_UPDATESTATUSBAR => 31

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_BACKGROUNDENUM => 32

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_DIDDRAGDROP => 36

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_SETISFV => 39

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_THISIDLIST => 41

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_ADDPROPERTYPAGES => 47

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_BACKGROUNDENUMDONE => 48

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_GETNOTIFY => 49

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_GETSORTDEFAULTS => 53

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_SIZE => 57

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_GETZONE => 58

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_GETPANE => 59

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_GETHELPTOPIC => 63

    /**
     * @type {Integer (Int32)}
     */
    static SFVM_GETANIMATION => 68
}
