#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct WLX_SHUTDOWN_TYPE {
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
    static WLX_SAS_ACTION_SHUTDOWN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_ACTION_SHUTDOWN_REBOOT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_ACTION_SHUTDOWN_POWER_OFF => 10
}
