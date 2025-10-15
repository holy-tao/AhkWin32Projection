#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains the information for a particular DHCPv6 user class or vendor class.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_class_info_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_CLASS_INFO_V6 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A pointer to a null-terminated Unicode string that contains the class name.
     * @type {PWSTR}
     */
    ClassName{
        get {
            if(!this.HasProp("__ClassName"))
                this.__ClassName := PWSTR(this.ptr + 0)
            return this.__ClassName
        }
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the comment for the class.
     * @type {PWSTR}
     */
    ClassComment{
        get {
            if(!this.HasProp("__ClassComment"))
                this.__ClassComment := PWSTR(this.ptr + 8)
            return this.__ClassComment
        }
    }

    /**
     * The length of data as pointed to by <b>ClassData</b>.
     * @type {Integer}
     */
    ClassDataLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * If <b>TRUE</b>, this information applies to a vendor class; if <b>FALSE</b>, it applies to a user class.
     * @type {BOOL}
     */
    IsVendor{
        get {
            if(!this.HasProp("__IsVendor"))
                this.__IsVendor := BOOL(this.ptr + 20)
            return this.__IsVendor
        }
    }

    /**
     * The vendor class identifier. It is default (0x00000000) for user class.
     * @type {Integer}
     */
    EnterpriseNumber {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * This field MUST be set to zero (0x00000000) when sending and ignored on receipt.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Pointer to a BYTE blob that contains an array of bytes of length specified by <b>ClassDataLength</b>. This contains opaque data regarding a user class or a vendor class.
     * @type {Pointer<Byte>}
     */
    ClassData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
