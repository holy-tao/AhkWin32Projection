#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_PROPERTY.ahk" { DHCP_PROPERTY }

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_PROPERTY_ARRAY {
    #StructPack 8

    NumElements : UInt32

    Elements : DHCP_PROPERTY.Ptr

}
