#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_CLIENT_INFO_VQ.ahk

/**
 * Specifies an array of DHCP_CLIENT_INFO_VQ structures.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_array_vq
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
class DHCP_CLIENT_INFO_ARRAY_VQ extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of elements in the array.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the first element in the array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_vq">DHCP_CLIENT_INFO_VQ</a> structures.
     * @type {Pointer<Pointer<DHCP_CLIENT_INFO_VQ>>}
     */
    Clients {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
