#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct SEND_MESSAGE_TIMEOUT_FLAGS {
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
    static SMTO_ABORTIFHUNG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SMTO_BLOCK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SMTO_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SMTO_NOTIMEOUTIFNOTHUNG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SMTO_ERRORONEXIT => 32
}
