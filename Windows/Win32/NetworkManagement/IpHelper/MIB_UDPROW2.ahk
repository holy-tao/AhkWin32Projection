#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_UDPROW2 extends Win32Struct
{
    static sizeof => 168

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwLocalAddr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwLocalPort {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwOwningPid {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    liCreateTimestamp {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * This bitfield backs the following members:
     * - SpecificPortBind
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    SpecificPortBind {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Array<UInt64>}
     */
    OwningModuleInfo{
        get {
            if(!this.HasProp("__OwningModuleInfoProxyArray"))
                this.__OwningModuleInfoProxyArray := Win32FixedArray(this.ptr + 32, 16, Primitive, "uint")
            return this.__OwningModuleInfoProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwRemoteAddr {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    dwRemotePort {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }
}
