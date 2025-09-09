#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NETWORK_ADDRESS_IP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    sin_port {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    IN_ADDR {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    sin_zero{
        get {
            if(!this.HasProp("__sin_zeroProxyArray"))
                this.__sin_zeroProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "char")
            return this.__sin_zeroProxyArray
        }
    }
}
