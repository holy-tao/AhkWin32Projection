#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Direction of network traffic.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ne-fwptypes-fwp_direction
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWP_DIRECTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies outbound traffic.
     * @type {Integer (Int32)}
     */
    static FWP_DIRECTION_OUTBOUND => 0

    /**
     * Specifies inbound traffic.
     * @type {Integer (Int32)}
     */
    static FWP_DIRECTION_INBOUND => 1

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static FWP_DIRECTION_MAX => 2
}
