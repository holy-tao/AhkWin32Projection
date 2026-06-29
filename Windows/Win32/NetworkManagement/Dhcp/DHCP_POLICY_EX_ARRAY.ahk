#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_POLICY_EX.ahk" { DHCP_POLICY_EX }

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_POLICY_EX_ARRAY {
    #StructPack 8

    NumElements : UInt32

    Elements : DHCP_POLICY_EX.Ptr

}
