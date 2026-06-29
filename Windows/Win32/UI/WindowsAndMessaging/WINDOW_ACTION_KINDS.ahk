#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct WINDOW_ACTION_KINDS {
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
    static WAK_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WAK_VISIBILITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static WAK_POSITION => 2

    /**
     * @type {Integer (Int32)}
     */
    static WAK_SIZE => 4

    /**
     * @type {Integer (Int32)}
     */
    static WAK_INSERT_AFTER => 8

    /**
     * @type {Integer (Int32)}
     */
    static WAK_ACTIVATE => 16

    /**
     * @type {Integer (Int32)}
     */
    static WAK_PLACEMENT_STATE => 32

    /**
     * @type {Integer (Int32)}
     */
    static WAK_NORMAL_RECT => 64

    /**
     * @type {Integer (Int32)}
     */
    static WAK_MOVE_TO_MONITOR => 128

    /**
     * @type {Integer (Int32)}
     */
    static WAK_FIT_TO_MONITOR => 256

    /**
     * @type {Integer (Int32)}
     */
    static WAK_DISPLAY_CHANGE => 512

    /**
     * @type {Integer (Int32)}
     */
    static WAK_SYSTEM_OPERATION => 1024

    /**
     * @type {Integer (Int32)}
     */
    static WAK_COALESCEABLE => 31
}
