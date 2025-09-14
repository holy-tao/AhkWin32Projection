#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RASPPPIPXA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<SByte>}
     */
    szIpxAddress{
        get {
            if(!this.HasProp("__szIpxAddressProxyArray"))
                this.__szIpxAddressProxyArray := Win32FixedArray(this.ptr + 8, 22, Primitive, "char")
            return this.__szIpxAddressProxyArray
        }
    }
}
