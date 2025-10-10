#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_POL_COND_ARRAY structure defines an array of DHCP server policy conditions.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_pol_cond_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_POL_COND_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Integer that specifies the number of DHCP server policy conditions in <i>Elements</i>.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_pol_cond">DHCP_POL_COND</a>  structures.
     * @type {Pointer<DHCP_POL_COND>}
     */
    Elements {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
