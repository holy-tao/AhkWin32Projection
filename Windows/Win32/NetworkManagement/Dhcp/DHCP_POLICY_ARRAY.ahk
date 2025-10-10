#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_POLICY_ARRAY structure defines an array of DHCP server policies.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_policy_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_POLICY_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Integer that specifies the number of DHCP server policies in <b>Elements</b>.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_policy">DHCP_POLICY</a>  structures.
     * @type {Pointer<DHCP_POLICY>}
     */
    Elements {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
