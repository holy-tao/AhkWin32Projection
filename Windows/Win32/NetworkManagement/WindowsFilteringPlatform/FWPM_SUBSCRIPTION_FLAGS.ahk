#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_SUBSCRIPTION_FLAGS {
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
    static FWPM_SUBSCRIPTION_FLAG_NOTIFY_ON_ADD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_SUBSCRIPTION_FLAG_NOTIFY_ON_DELETE => 2
}
