#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an IPv6 client class ID.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpv6csdk/ns-dhcpv6csdk-dhcpv6capi_classid
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPV6CAPI_CLASSID extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Reserved for future use.  Must be set to 0.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Class ID binary data.
     * @type {Pointer<Integer>}
     */
    Data {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    nBytesData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
