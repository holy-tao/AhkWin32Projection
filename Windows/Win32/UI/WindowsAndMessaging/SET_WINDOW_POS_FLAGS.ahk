#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct SET_WINDOW_POS_FLAGS {
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
    static SWP_ASYNCWINDOWPOS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_DEFERERASE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_DRAWFRAME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_FRAMECHANGED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_HIDEWINDOW => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOACTIVATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOCOPYBITS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOMOVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOOWNERZORDER => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOREDRAW => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOREPOSITION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOSENDCHANGING => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOSIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_NOZORDER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SWP_SHOWWINDOW => 64
}
