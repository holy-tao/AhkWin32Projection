#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a DHCP option class.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_class_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_CLASS_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Unicode string that contains the name of the class.
     * @type {Pointer<Char>}
     */
    ClassName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Unicode string that contains a comment associated with the class.
     * @type {Pointer<Char>}
     */
    ClassComment {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the size of <b>ClassData</b>, in bytes. When passing this structure into <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcpgetclassinfo">DhcpGetClassInfo</a>, this value should be set to the size of the initialized buffer.
     * @type {Integer}
     */
    ClassDataLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies whether or not this option class is a vendor-defined option class. If <b>TRUE</b>, it is a vendor class; if not, it is not a vendor class. Vendor-defined option classes can be used by DHCP clients that are configured to optionally identify themselves by their vendor type to the DHCP server when obtaining a lease.
     * @type {Integer}
     */
    IsVendor {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Specifies a bit flag that indicates whether or not the options are vendor-specific. If it is not, this parameter should be 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_FLAGS_OPTION_IS_VENDOR"></a><a id="dhcp_flags_option_is_vendor"></a><dl>
     * <dt><b>DHCP_FLAGS_OPTION_IS_VENDOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag should be set if the option is provided by a vendor.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Pointer to a byte buffer that contains specific data for the class. When passing this structure into <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcpgetclassinfo">DhcpGetClassInfo</a>, this buffer should be initialized to the anticipated size of the data to be returned.
     * @type {Pointer<Byte>}
     */
    ClassData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
