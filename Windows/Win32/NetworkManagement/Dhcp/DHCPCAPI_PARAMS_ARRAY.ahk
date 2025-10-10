#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCPCAPI_PARAMS_ARRAY structure stores an array of DHCPAPI_PARAMS structures used to query DHCP parameters.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpcsdk/ns-dhcpcsdk-dhcpcapi_params_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPCAPI_PARAMS_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of elements in the <b>Params</b> array.
     * @type {Integer}
     */
    nParams {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpcsdk/ns-dhcpcsdk-dhcpapi_params">DHCPAPI_PARAMS</a> structures.
     * @type {Pointer<DHCPAPI_PARAMS>}
     */
    Params {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
