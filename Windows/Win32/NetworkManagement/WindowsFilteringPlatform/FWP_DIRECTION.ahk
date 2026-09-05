#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Direction of network traffic.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ne-fwptypes-fwp_direction
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWP_DIRECTION extends Win32Enum {

    /**
     * Specifies outbound traffic.
     * Native name: FWP_DIRECTION_OUTBOUND
     * @type {Integer (Int32)}
     */
    static OUTBOUND => 0

    /**
     * Specifies inbound traffic.
     * Native name: FWP_DIRECTION_INBOUND
     * @type {Integer (Int32)}
     */
    static INBOUND => 1

    /**
     * Maximum value for testing purposes.
     * Native name: FWP_DIRECTION_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 2
}
