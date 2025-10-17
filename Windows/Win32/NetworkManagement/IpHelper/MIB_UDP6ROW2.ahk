#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_UDP6ROW2 extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    ucLocalAddr{
        get {
            if(!this.HasProp("__ucLocalAddrProxyArray"))
                this.__ucLocalAddrProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__ucLocalAddrProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwLocalScopeId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwLocalPort {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwOwningPid {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    liCreateTimestamp {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * This bitfield backs the following members:
     * - SpecificPortBind
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
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
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Array<UInt64>}
     */
    OwningModuleInfo{
        get {
            if(!this.HasProp("__OwningModuleInfoProxyArray"))
                this.__OwningModuleInfoProxyArray := Win32FixedArray(this.ptr + 48, 16, Primitive, "uint")
            return this.__OwningModuleInfoProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ucRemoteAddr{
        get {
            if(!this.HasProp("__ucRemoteAddrProxyArray"))
                this.__ucRemoteAddrProxyArray := Win32FixedArray(this.ptr + 176, 16, Primitive, "char")
            return this.__ucRemoteAddrProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwRemoteScopeId {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    dwRemotePort {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }
}
