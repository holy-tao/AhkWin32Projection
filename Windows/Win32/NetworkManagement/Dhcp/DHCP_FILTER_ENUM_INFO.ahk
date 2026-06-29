#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_FILTER_RECORD.ahk" { DHCP_FILTER_RECORD }

/**
 * Contains information regarding the number of link-layer filter records.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_filter_enum_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_FILTER_ENUM_INFO {
    #StructPack 8

    /**
     * Integer value that specifies the number of link-layer filter records contained in the array specified by pEnumRecords.
     */
    NumElements : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_filter_record">DHCP_FILTER_RECORD</a> structures that contain link-layer filter records.
     */
    pEnumRecords : DHCP_FILTER_RECORD.Ptr

}
