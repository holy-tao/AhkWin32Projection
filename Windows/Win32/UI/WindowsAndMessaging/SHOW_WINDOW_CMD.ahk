#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct SHOW_WINDOW_CMD {
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
    static SW_HIDE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SW_SHOWNORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SW_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SW_SHOWMINIMIZED => 2

    /**
     * @type {Integer (Int32)}
     */
    static SW_SHOWMAXIMIZED => 3

    /**
     * @type {Integer (Int32)}
     */
    static SW_MAXIMIZE => 3

    /**
     * @type {Integer (Int32)}
     */
    static SW_SHOWNOACTIVATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SW_SHOW => 5

    /**
     * @type {Integer (Int32)}
     */
    static SW_MINIMIZE => 6

    /**
     * @type {Integer (Int32)}
     */
    static SW_SHOWMINNOACTIVE => 7

    /**
     * @type {Integer (Int32)}
     */
    static SW_SHOWNA => 8

    /**
     * @type {Integer (Int32)}
     */
    static SW_RESTORE => 9

    /**
     * @type {Integer (Int32)}
     */
    static SW_SHOWDEFAULT => 10

    /**
     * @type {Integer (Int32)}
     */
    static SW_FORCEMINIMIZE => 11

    /**
     * @type {Integer (Int32)}
     */
    static SW_MAX => 11
}
