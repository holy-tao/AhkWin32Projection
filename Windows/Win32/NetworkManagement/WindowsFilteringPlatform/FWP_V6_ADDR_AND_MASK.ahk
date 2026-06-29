#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies an IPv6 address and mask.
 * @remarks
 * The mask is specified by the width in bits. For
 * example, a prefixLength of 16 specifies a mask consisting of 16 1's followed
 * by 112 0's.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ns-fwptypes-fwp_v6_addr_and_mask
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWP_V6_ADDR_AND_MASK {
    #StructPack 1

    /**
     * An array of size <b>FWP_V6_ADDR_SIZE</b> bytes containing an IPv6 address. <b>FWP_V6_ADDR_SIZE</b> maps to 16.
     */
    addr : Int8[16]

    /**
     * Value specifying the prefix length of the IPv6 address.
     */
    prefixLength : Int8

}
