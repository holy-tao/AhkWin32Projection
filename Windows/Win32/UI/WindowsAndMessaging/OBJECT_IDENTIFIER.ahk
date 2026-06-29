#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct OBJECT_IDENTIFIER {
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
    static OBJID_WINDOW => 0

    /**
     * @type {Integer (Int32)}
     */
    static OBJID_SYSMENU => -1

    /**
     * @type {Integer (Int32)}
     */
    static OBJID_TITLEBAR => -2

    /**
     * @type {Integer (Int32)}
     */
    static OBJID_MENU => -3

    /**
     * @type {Integer (Int32)}
     */
    static OBJID_CLIENT => -4

    /**
     * @type {Integer (Int32)}
     */
    static OBJID_VSCROLL => -5

    /**
     * @type {Integer (Int32)}
     */
    static OBJID_HSCROLL => -6

    /**
     * @type {Integer (Int32)}
     */
    static OBJID_SIZEGRIP => -7

    /**
     * @type {Integer (Int32)}
     */
    static OBJID_CARET => -8

    /**
     * @type {Integer (Int32)}
     */
    static OBJID_CURSOR => -9

    /**
     * @type {Integer (Int32)}
     */
    static OBJID_ALERT => -10

    /**
     * @type {Integer (Int32)}
     */
    static OBJID_SOUND => -11

    /**
     * @type {Integer (Int32)}
     */
    static OBJID_QUERYCLASSNAMEIDX => -12

    /**
     * @type {Integer (Int32)}
     */
    static OBJID_NATIVEOM => -16
}
