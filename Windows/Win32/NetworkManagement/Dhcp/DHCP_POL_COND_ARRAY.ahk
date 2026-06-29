#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_POL_COND.ahk" { DHCP_POL_COND }

/**
 * The DHCP_POL_COND_ARRAY structure defines an array of DHCP server policy conditions.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_pol_cond_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_POL_COND_ARRAY {
    #StructPack 8

    /**
     * Integer that specifies the number of DHCP server policy conditions in <i>Elements</i>.
     */
    NumElements : UInt32

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_pol_cond">DHCP_POL_COND</a>  structures.
     */
    Elements : DHCP_POL_COND.Ptr

}
