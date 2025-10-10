#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information regarding the number of link-layer filter records.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_filter_enum_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_FILTER_ENUM_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Integer value that specifies the number of link-layer filter records contained in the array specified by pEnumRecords.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_filter_record">DHCP_FILTER_RECORD</a> structures that contain link-layer filter records.
     * @type {Pointer<DHCP_FILTER_RECORD>}
     */
    pEnumRecords {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
