#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_FILTER_FLAGS {
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
    static FWPM_FILTER_FLAG_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_PERSISTENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_BOOTTIME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_HAS_PROVIDER_CONTEXT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_CLEAR_ACTION_RIGHT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_PERMIT_IF_CALLOUT_UNREGISTERED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_DISABLED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_FILTER_FLAG_INDEXED => 64
}
