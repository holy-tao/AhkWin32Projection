#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the enabling and disabling of the allow and deny filter lists.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_filter_global_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_FILTER_GLOBAL_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * If <b>TRUE</b>, the allow list is enabled; if <b>FALSE</b>, it is disabled.
     * @type {Integer}
     */
    EnforceAllowList {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * If <b>TRUE</b>, the deny list is enabled; if <b>FALSE</b>, it is disabled.
     * @type {Integer}
     */
    EnforceDenyList {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
