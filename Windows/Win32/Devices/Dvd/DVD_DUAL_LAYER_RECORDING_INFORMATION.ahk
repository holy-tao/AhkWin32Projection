#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_DUAL_LAYER_RECORDING_INFORMATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 1

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - Layer0SectorsImmutable
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 0) | (this._bitfield & ~(0x7F << 0))
    }

    /**
     * @type {Integer}
     */
    Layer0SectorsImmutable {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 1, 3, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Layer0Sectors{
        get {
            if(!this.HasProp("__Layer0SectorsProxyArray"))
                this.__Layer0SectorsProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "char")
            return this.__Layer0SectorsProxyArray
        }
    }
}
