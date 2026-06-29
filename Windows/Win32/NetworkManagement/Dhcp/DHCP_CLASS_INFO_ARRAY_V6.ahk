#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_CLASS_INFO_V6.ahk" { DHCP_CLASS_INFO_V6 }

/**
 * The DHCP_CLASS_INFO_ARRAY_V6 structure contains a list of information regarding a user class or a vendor class.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info_array_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_CLASS_INFO_ARRAY_V6 {
    #StructPack 8

    /**
     * This is of type <b>DWORD</b>, specifying the number of classes whose information is contained in the array specified by Classes.
     */
    NumElements : UInt32

    /**
     * A pointer to an array of structures <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info_v6">DHCP_CLASS_INFO_V6</a> (section 2.2.1.2.70) that contains information regarding the various user classes and vendor classes.
     */
    Classes : DHCP_CLASS_INFO_V6.Ptr

}
