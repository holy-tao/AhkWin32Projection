#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the network type of a vSwitch.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ne-fwptypes-fwp_vswitch_network_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWP_VSWITCH_NETWORK_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies an unknown network type.
     * @type {Integer (Int32)}
     */
    static FWP_VSWITCH_NETWORK_TYPE_UNKNOWN => 0

    /**
     * Specifies a private network.
     * @type {Integer (Int32)}
     */
    static FWP_VSWITCH_NETWORK_TYPE_PRIVATE => 1

    /**
     * Specifies an internal network.
     * @type {Integer (Int32)}
     */
    static FWP_VSWITCH_NETWORK_TYPE_INTERNAL => 2

    /**
     * Specifies an external network.
     * @type {Integer (Int32)}
     */
    static FWP_VSWITCH_NETWORK_TYPE_EXTERNAL => 3
}
