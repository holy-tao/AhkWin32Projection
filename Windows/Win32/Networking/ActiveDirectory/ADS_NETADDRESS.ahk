#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADS_NETADDRESS structure is an ADSI representation of the Net Address attribute syntax.
 * @see https://docs.microsoft.com/windows/win32/api//iads/ns-iads-ads_netaddress
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_NETADDRESS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Types of communication protocols.
     * @type {Integer}
     */
    AddressType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Address length in bytes.
     * @type {Integer}
     */
    AddressLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A network address.
     * @type {Pointer<Integer>}
     */
    Address {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
