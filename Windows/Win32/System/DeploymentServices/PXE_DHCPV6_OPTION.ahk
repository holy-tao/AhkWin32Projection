#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PXE_DHCPV6_OPTION structure can be used with the Windows Deployment Services PXE Server API.
 * @see https://docs.microsoft.com/windows/win32/api//wdspxe/ns-wdspxe-pxe_dhcpv6_option
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class PXE_DHCPV6_OPTION extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * A DHCPv6 option type.
     * @type {Integer}
     */
    OptionCode {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Length of the option value.
     * @type {Integer}
     */
    DataLength {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The option value.
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
