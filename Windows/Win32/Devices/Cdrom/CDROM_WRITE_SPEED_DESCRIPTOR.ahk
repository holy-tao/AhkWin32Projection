#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_WRITE_SPEED_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * This bitfield backs the following members:
     * - MixedReadWrite
     * - Exact
     * - Reserved1
     * - WriteRotationControl
     * - Reserved2
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MixedReadWrite {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Exact {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    WriteRotationControl {
        get => (this._bitfield >> 3) & 0x3
        set => this._bitfield := ((value & 0x3) << 3) | (this._bitfield & ~(0x3 << 3))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 1, 3, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    EndLba{
        get {
            if(!this.HasProp("__EndLbaProxyArray"))
                this.__EndLbaProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "char")
            return this.__EndLbaProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ReadSpeed{
        get {
            if(!this.HasProp("__ReadSpeedProxyArray"))
                this.__ReadSpeedProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "char")
            return this.__ReadSpeedProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    WriteSpeed{
        get {
            if(!this.HasProp("__WriteSpeedProxyArray"))
                this.__WriteSpeedProxyArray := Win32FixedArray(this.ptr + 12, 4, Primitive, "char")
            return this.__WriteSpeedProxyArray
        }
    }
}
