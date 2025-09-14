#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DWORD_DWORD.ahk
#Include .\DHCP_BINARY_DATA.ahk

/**
 * The DHCP_OPTION_DATA_ELEMENT structure defines a data element present (either singly or as a member of an array) within a DHCP_OPTION_DATA structure.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_option_data_element
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_OPTION_DATA_ELEMENT extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_option_data_type">DHCP_OPTION_DATA_TYPE</a> enumeration value that indicates the type of data that is present in the subsequent field, <b>Element</b>.
     * @type {Integer}
     */
    OptionType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ByteOption {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    WordOption {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DWordOption {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {DWORD_DWORD}
     */
    DWordDWordOption{
        get {
            if(!this.HasProp("__DWordDWordOption"))
                this.__DWordDWordOption := DWORD_DWORD(this.ptr + 8)
            return this.__DWordDWordOption
        }
    }

    /**
     * @type {Integer}
     */
    IpAddressOption {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    StringDataOption {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {DHCP_BINARY_DATA}
     */
    BinaryDataOption{
        get {
            if(!this.HasProp("__BinaryDataOption"))
                this.__BinaryDataOption := DHCP_BINARY_DATA(this.ptr + 8)
            return this.__BinaryDataOption
        }
    }

    /**
     * @type {DHCP_BINARY_DATA}
     */
    EncapsulatedDataOption{
        get {
            if(!this.HasProp("__EncapsulatedDataOption"))
                this.__EncapsulatedDataOption := DHCP_BINARY_DATA(this.ptr + 8)
            return this.__EncapsulatedDataOption
        }
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    Ipv6AddressDataOption {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
