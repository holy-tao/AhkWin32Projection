#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_RAM_RECORDING_TYPE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - RealTimeData
     * - Reserved1
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
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    RealTimeData {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 1, 3, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }
}
