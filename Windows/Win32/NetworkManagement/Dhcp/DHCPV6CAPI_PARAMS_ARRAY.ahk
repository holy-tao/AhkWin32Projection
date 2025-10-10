#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an array of requested parameters.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpv6csdk/ns-dhcpv6csdk-dhcpv6capi_params_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPV6CAPI_PARAMS_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of parameters in the array.
     * @type {Integer}
     */
    nParams {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6capi_params">DHCPV6CAPI_PARAMS</a> structure that contains a parameter.
     * @type {Pointer<DHCPV6CAPI_PARAMS>}
     */
    Params {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
