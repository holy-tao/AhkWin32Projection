#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Console
 */
export default struct CONSOLE_MODE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_PROCESSED_INPUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_LINE_INPUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_ECHO_INPUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_WINDOW_INPUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_MOUSE_INPUT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_INSERT_MODE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_QUICK_EDIT_MODE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_EXTENDED_FLAGS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_AUTO_POSITION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_VIRTUAL_TERMINAL_INPUT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_PROCESSED_OUTPUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_WRAP_AT_EOL_OUTPUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_VIRTUAL_TERMINAL_PROCESSING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISABLE_NEWLINE_AUTO_RETURN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_LVB_GRID_WORLDWIDE => 16
}
