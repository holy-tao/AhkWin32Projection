#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWP_ACTION_TYPE {
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
    static FWP_ACTION_BLOCK => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_PERMIT => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_CALLOUT_TERMINATING => 20483

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_CALLOUT_INSPECTION => 24580

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_CALLOUT_UNKNOWN => 16389

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_CONTINUE => 8198

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_NONE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FWP_ACTION_NONE_NO_MATCH => 8
}
