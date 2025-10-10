#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPNETROW_LH extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwPhysAddrLen {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    bPhysAddr{
        get {
            if(!this.HasProp("__bPhysAddrProxyArray"))
                this.__bPhysAddrProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "char")
            return this.__bPhysAddrProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwAddr {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
