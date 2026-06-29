#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_DATA_STATE_ACTION {
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
    static WTD_STATEACTION_IGNORE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_STATEACTION_VERIFY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_STATEACTION_CLOSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_STATEACTION_AUTO_CACHE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_STATEACTION_AUTO_CACHE_FLUSH => 4
}
