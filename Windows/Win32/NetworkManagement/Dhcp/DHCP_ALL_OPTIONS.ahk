#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the set of all options available on a DHCP server.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_all_options
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_ALL_OPTIONS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Reserved. This value should be set to 0.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_array">DHCP_OPTION_ARRAY</a> structure that contains the set of non-vendor options.
     * @type {Pointer<DHCP_OPTION_ARRAY>}
     */
    NonVendorOptions {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the number of vendor options listed in <b>VendorOptions</b>.
     * @type {Integer}
     */
    NumVendorOptions {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to a list of structures that contain the following fields.
     * @type {Pointer<_Anonymous_e__Struct>}
     */
    VendorOptions {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
