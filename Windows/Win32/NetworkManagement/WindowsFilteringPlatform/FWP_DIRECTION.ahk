#Requires AutoHotkey v2.0.0 64-bit

/**
 * Direction of network traffic.
 * @see https://docs.microsoft.com/windows/win32/api//fwptypes/ne-fwptypes-fwp_direction
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_DIRECTION{

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
