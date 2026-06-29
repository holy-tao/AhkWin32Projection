#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_POLICY.ahk" { DHCP_POLICY }

/**
 * The DHCP_POLICY_ARRAY structure defines an array of DHCP server policies.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_policy_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_POLICY_ARRAY {
    #StructPack 8

    /**
     * Integer that specifies the number of DHCP server policies in <b>Elements</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_policy">DHCP_POLICY</a>  structures.
     */
    Elements : DHCP_POLICY.Ptr

}
