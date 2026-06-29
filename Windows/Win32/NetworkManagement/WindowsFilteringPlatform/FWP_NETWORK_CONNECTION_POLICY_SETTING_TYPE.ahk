#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWP_NETWORK_CONNECTION_POLICY_SETTING_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static FWP_NETWORK_CONNECTION_POLICY_SOURCE_ADDRESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static FWP_NETWORK_CONNECTION_POLICY_NEXT_HOP_INTERFACE => 1

    /**
     * @type {Integer (Int32)}
     */
    static FWP_NETWORK_CONNECTION_POLICY_NEXT_HOP => 2

    /**
     * @type {Integer (Int32)}
     */
    static FWP_NETWORK_CONNECTION_POLICY_MAX => 3
}
