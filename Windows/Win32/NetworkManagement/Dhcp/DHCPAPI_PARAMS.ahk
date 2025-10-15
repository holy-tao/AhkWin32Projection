#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The DHCPAPI_PARAMS structure is used to request DHCP parameters.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpcsdk/ns-dhcpcsdk-dhcpapi_params
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPAPI_PARAMS extends Win32Struct
{
    static sizeof => 32

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
     * Identifier for the DHCP parameter being requested.
     * @type {Integer}
     */
    OptionId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies whether the DHCP parameter is vendor-specific. Set to <b>TRUE</b> if the parameter is vendor-specific.
     * @type {BOOL}
     */
    IsVendor{
        get {
            if(!this.HasProp("__IsVendor"))
                this.__IsVendor := BOOL(this.ptr + 8)
            return this.__IsVendor
        }
    }

    /**
     * Pointer to the parameter data.
     * @type {Pointer<Byte>}
     */
    Data {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    nBytesData {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
