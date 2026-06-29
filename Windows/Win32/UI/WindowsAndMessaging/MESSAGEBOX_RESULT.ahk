#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MESSAGEBOX_RESULT {
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
    static IDOK => 1

    /**
     * @type {Integer (Int32)}
     */
    static IDCANCEL => 2

    /**
     * @type {Integer (Int32)}
     */
    static IDABORT => 3

    /**
     * @type {Integer (Int32)}
     */
    static IDRETRY => 4

    /**
     * @type {Integer (Int32)}
     */
    static IDIGNORE => 5

    /**
     * @type {Integer (Int32)}
     */
    static IDYES => 6

    /**
     * @type {Integer (Int32)}
     */
    static IDNO => 7

    /**
     * @type {Integer (Int32)}
     */
    static IDCLOSE => 8

    /**
     * @type {Integer (Int32)}
     */
    static IDHELP => 9

    /**
     * @type {Integer (Int32)}
     */
    static IDTRYAGAIN => 10

    /**
     * @type {Integer (Int32)}
     */
    static IDCONTINUE => 11

    /**
     * @type {Integer (Int32)}
     */
    static IDASYNC => 32001

    /**
     * @type {Integer (Int32)}
     */
    static IDTIMEOUT => 32000
}
