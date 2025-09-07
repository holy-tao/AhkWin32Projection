#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PXE_DHCP_OPTION structure can be used with the Windows Deployment Services PXE Server API.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/ns-wdspxe-pxe_dhcp_option
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class PXE_DHCP_OPTION extends Win32Struct
{
    static sizeof => 3

    static packingSize => 1

    /**
     * A DHCP option type.
     * @type {Integer}
     */
    OptionType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Length of the option value.
     * @type {Integer}
     */
    OptionLength {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * The option value.
     * @type {Array<Byte>}
     */
    OptionValue{
        get {
            if(!this.HasProp("__OptionValueProxyArray"))
                this.__OptionValueProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__OptionValueProxyArray
        }
    }
}
