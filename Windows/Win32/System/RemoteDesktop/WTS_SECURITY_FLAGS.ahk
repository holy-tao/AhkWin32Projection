#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_SECURITY_FLAGS {
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
    static WTS_SECURITY_CURRENT_GUEST_ACCESS => 72

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SECURITY_USER_ACCESS => 329

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SECURITY_CURRENT_USER_ACCESS => 590

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SECURITY_ALL_ACCESS => 983999

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SECURITY_QUERY_INFORMATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SECURITY_SET_INFORMATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SECURITY_RESET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SECURITY_VIRTUAL_CHANNELS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SECURITY_REMOTE_CONTROL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SECURITY_LOGON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SECURITY_LOGOFF => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SECURITY_MESSAGE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SECURITY_CONNECT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SECURITY_DISCONNECT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SECURITY_GUEST_ACCESS => 32
}
