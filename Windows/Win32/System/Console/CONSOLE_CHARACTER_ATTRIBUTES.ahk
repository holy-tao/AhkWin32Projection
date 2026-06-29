#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Console
 */
export default struct CONSOLE_CHARACTER_ATTRIBUTES {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static FOREGROUND_BLUE => 1

    /**
     * @type {Integer (UInt16)}
     */
    static FOREGROUND_GREEN => 2

    /**
     * @type {Integer (UInt16)}
     */
    static FOREGROUND_RED => 4

    /**
     * @type {Integer (UInt16)}
     */
    static FOREGROUND_INTENSITY => 8

    /**
     * @type {Integer (UInt16)}
     */
    static BACKGROUND_BLUE => 16

    /**
     * @type {Integer (UInt16)}
     */
    static BACKGROUND_GREEN => 32

    /**
     * @type {Integer (UInt16)}
     */
    static BACKGROUND_RED => 64

    /**
     * @type {Integer (UInt16)}
     */
    static BACKGROUND_INTENSITY => 128

    /**
     * @type {Integer (UInt16)}
     */
    static COMMON_LVB_LEADING_BYTE => 256

    /**
     * @type {Integer (UInt16)}
     */
    static COMMON_LVB_TRAILING_BYTE => 512

    /**
     * @type {Integer (UInt16)}
     */
    static COMMON_LVB_GRID_HORIZONTAL => 1024

    /**
     * @type {Integer (UInt16)}
     */
    static COMMON_LVB_GRID_LVERTICAL => 2048

    /**
     * @type {Integer (UInt16)}
     */
    static COMMON_LVB_GRID_RVERTICAL => 4096

    /**
     * @type {Integer (UInt16)}
     */
    static COMMON_LVB_REVERSE_VIDEO => 16384

    /**
     * @type {Integer (UInt16)}
     */
    static COMMON_LVB_UNDERSCORE => 32768

    /**
     * @type {Integer (UInt16)}
     */
    static COMMON_LVB_SBCSDBCS => 768
}
