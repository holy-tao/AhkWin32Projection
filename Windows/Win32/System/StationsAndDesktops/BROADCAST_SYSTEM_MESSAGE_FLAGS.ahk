#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.StationsAndDesktops
 */
export default struct BROADCAST_SYSTEM_MESSAGE_FLAGS {
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
    static BSF_ALLOWSFW => 128

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_FLUSHDISK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_FORCEIFHUNG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_IGNORECURRENTTASK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_NOHANG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_NOTIMEOUTIFNOTHUNG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_POSTMESSAGE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_QUERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_SENDNOTIFYMESSAGE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_LUID => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_RETURNHDESK => 512
}
