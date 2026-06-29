#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Recovery
 */
export default struct REGISTER_APPLICATION_RESTART_FLAGS {
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
    static RESTART_NO_CRASH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RESTART_NO_HANG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RESTART_NO_PATCH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RESTART_NO_REBOOT => 8
}
