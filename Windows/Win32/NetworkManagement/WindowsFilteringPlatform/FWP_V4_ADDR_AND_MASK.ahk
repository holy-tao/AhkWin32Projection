#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies IPv4 address and mask in host order.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ns-fwptypes-fwp_v4_addr_and_mask
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWP_V4_ADDR_AND_MASK {
    #StructPack 4

    /**
     * Specifies an IPv4 address.
     */
    addr : UInt32

    /**
     * Specifies an IPv4 mask.
     */
    mask : UInt32

}
