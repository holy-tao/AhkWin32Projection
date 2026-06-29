#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct MOUSE_EVENT_FLAGS {
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
    static MOUSEEVENTF_ABSOLUTE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSEEVENTF_LEFTDOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSEEVENTF_LEFTUP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSEEVENTF_MIDDLEDOWN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSEEVENTF_MIDDLEUP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSEEVENTF_MOVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSEEVENTF_RIGHTDOWN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSEEVENTF_RIGHTUP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSEEVENTF_WHEEL => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSEEVENTF_XDOWN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSEEVENTF_XUP => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSEEVENTF_HWHEEL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSEEVENTF_MOVE_NOCOALESCE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSEEVENTF_VIRTUALDESK => 16384
}
