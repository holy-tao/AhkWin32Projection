#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Shutdown
 */
export default struct EXIT_WINDOWS_FLAGS {
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
    static EWX_LOGOFF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EWX_SHUTDOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EWX_REBOOT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EWX_FORCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EWX_POWEROFF => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EWX_FORCEIFHUNG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EWX_QUICKRESOLVE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EWX_RESTARTAPPS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EWX_HYBRID_SHUTDOWN => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static EWX_BOOTOPTIONS => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static EWX_ARSO => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static EWX_CHECK_SAFE_FOR_SERVER => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static EWX_SYSTEM_INITIATED => 268435456
}
