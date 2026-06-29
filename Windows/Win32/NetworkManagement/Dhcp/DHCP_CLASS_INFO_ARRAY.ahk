#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_CLASS_INFO.ahk" { DHCP_CLASS_INFO }

/**
 * Defines an array of elements that contain DHCP class information.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_CLASS_INFO_ARRAY {
    #StructPack 8

    /**
     * Specifies the number of elements in <b>Classes</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info">DHCP_CLASS_INFO</a> structures that contain DHCP class information.
     */
    Classes : DHCP_CLASS_INFO.Ptr

}
