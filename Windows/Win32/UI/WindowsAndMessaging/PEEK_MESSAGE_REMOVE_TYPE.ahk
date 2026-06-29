#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct PEEK_MESSAGE_REMOVE_TYPE {
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
    static PM_NOREMOVE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PM_REMOVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PM_NOYIELD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PM_QS_INPUT => 67567616

    /**
     * @type {Integer (UInt32)}
     */
    static PM_QS_POSTMESSAGE => 9961472

    /**
     * @type {Integer (UInt32)}
     */
    static PM_QS_PAINT => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PM_QS_SENDMESSAGE => 4194304
}
