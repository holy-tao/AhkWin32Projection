#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_CLASS_INFO_ARRAY_V6 structure contains a list of information regarding a user class or a vendor class.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_class_info_array_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_CLASS_INFO_ARRAY_V6 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * This is of type <b>DWORD</b>, specifying the number of classes whose information is contained in the array specified by Classes.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an array of structures <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info_v6">DHCP_CLASS_INFO_V6</a> (section 2.2.1.2.70) that contains information regarding the various user classes and vendor classes.
     * @type {Pointer<DHCP_CLASS_INFO_V6>}
     */
    Classes {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
