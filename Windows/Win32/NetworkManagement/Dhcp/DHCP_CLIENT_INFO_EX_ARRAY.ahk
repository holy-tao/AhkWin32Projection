#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_CLIENT_INFO_EX.ahk" { DHCP_CLIENT_INFO_EX }

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_CLIENT_INFO_EX_ARRAY {
    #StructPack 8

    NumElements : UInt32

    Clients : IntPtr

}
