#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a requested parameter.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6capi_params
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPV6CAPI_PARAMS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Identifier for the DHCPv6 parameter being requested.
     * 
     * <a id="DHCPV6_OPTION_CLIENTID"></a>
     * <a id="dhcpv6_option_clientid"></a>
     * @type {Integer}
     */
    OptionId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This option is set to <b>TRUE</b> if this parameter is vendor-specific.  Otherwise, it is <b>FALSE</b>.
     * @type {Integer}
     */
    IsVendor {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Contains the actual parameter data.
     * @type {Pointer<Byte>}
     */
    Data {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Size of the <b>Data</b> member, in bytes.
     * @type {Integer}
     */
    nBytesData {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
