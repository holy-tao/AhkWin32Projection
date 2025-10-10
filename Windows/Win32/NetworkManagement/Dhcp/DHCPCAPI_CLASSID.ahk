#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCPCAPI_CLASSID structure defines a client Class ID.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpcsdk/ns-dhcpcsdk-dhcpcapi_classid
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPCAPI_CLASSID extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Reserved. Must be set to zero.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Class ID binary data.
     * @type {Pointer<Byte>}
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
