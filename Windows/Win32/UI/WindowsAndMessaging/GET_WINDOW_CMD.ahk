#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct GET_WINDOW_CMD {
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
    static GW_CHILD => 5

    /**
     * @type {Integer (UInt32)}
     */
    static GW_ENABLEDPOPUP => 6

    /**
     * @type {Integer (UInt32)}
     */
    static GW_HWNDFIRST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GW_HWNDLAST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GW_HWNDNEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GW_HWNDPREV => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GW_OWNER => 4
}
