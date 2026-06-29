#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct WINDOW_ACTION_MODIFIERS {
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
    static WAM_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WAM_FRAME_BOUNDS => 1

    /**
     * @type {Integer (Int32)}
     */
    static WAM_ACTIVATE_FOREGROUND => 2

    /**
     * @type {Integer (Int32)}
     */
    static WAM_ACTIVATE_INPUT => 4

    /**
     * @type {Integer (Int32)}
     */
    static WAM_ACTIVATE_NO_ZORDER => 8

    /**
     * @type {Integer (Int32)}
     */
    static WAM_INSERT_AFTER_NO_OWNER => 16

    /**
     * @type {Integer (Int32)}
     */
    static WAM_RESTORE_TO_NORMAL => 32

    /**
     * @type {Integer (Int32)}
     */
    static WAM_RESTORE_TO_MAXIMIZED => 64

    /**
     * @type {Integer (Int32)}
     */
    static WAM_RESTORE_TO_ARRANGED => 128

    /**
     * @type {Integer (Int32)}
     */
    static WAM_WORK_AREA => 256

    /**
     * @type {Integer (Int32)}
     */
    static WAM_DPI => 512

    /**
     * @type {Integer (Int32)}
     */
    static WAM_SCALED_TO_MONITOR => 1024
}
