#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct WINDOWS_HOOK_ID {
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
    static WH_CALLWNDPROC => 4

    /**
     * @type {Integer (Int32)}
     */
    static WH_CALLWNDPROCRET => 12

    /**
     * @type {Integer (Int32)}
     */
    static WH_CBT => 5

    /**
     * @type {Integer (Int32)}
     */
    static WH_DEBUG => 9

    /**
     * @type {Integer (Int32)}
     */
    static WH_FOREGROUNDIDLE => 11

    /**
     * @type {Integer (Int32)}
     */
    static WH_GETMESSAGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static WH_JOURNALPLAYBACK => 1

    /**
     * @type {Integer (Int32)}
     */
    static WH_JOURNALRECORD => 0

    /**
     * @type {Integer (Int32)}
     */
    static WH_KEYBOARD => 2

    /**
     * @type {Integer (Int32)}
     */
    static WH_KEYBOARD_LL => 13

    /**
     * @type {Integer (Int32)}
     */
    static WH_MOUSE => 7

    /**
     * @type {Integer (Int32)}
     */
    static WH_MOUSE_LL => 14

    /**
     * @type {Integer (Int32)}
     */
    static WH_MSGFILTER => -1

    /**
     * @type {Integer (Int32)}
     */
    static WH_SHELL => 10

    /**
     * @type {Integer (Int32)}
     */
    static WH_SYSMSGFILTER => 6
}
