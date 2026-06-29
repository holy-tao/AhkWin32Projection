#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Touch
 */
export default struct TOUCHEVENTF_FLAGS {
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
    static TOUCHEVENTF_MOVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHEVENTF_DOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHEVENTF_UP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHEVENTF_INRANGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHEVENTF_PRIMARY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHEVENTF_NOCOALESCE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHEVENTF_PEN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TOUCHEVENTF_PALM => 128
}
