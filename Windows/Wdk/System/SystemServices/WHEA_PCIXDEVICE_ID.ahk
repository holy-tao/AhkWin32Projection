#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_PCIXDEVICE_ID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    VendorId {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DeviceId {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * This bitfield backs the following members:
     * - ClassCode
     * - FunctionNumber
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ClassCode {
        get => (this._bitfield1 >> 0) & 0xFFFFFF
        set => this._bitfield1 := ((value & 0xFFFFFF) << 0) | (this._bitfield1 & ~(0xFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    FunctionNumber {
        get => (this._bitfield1 >> 24) & 0xFF
        set => this._bitfield1 := ((value & 0xFF) << 24) | (this._bitfield1 & ~(0xFF << 24))
    }

    /**
     * This bitfield backs the following members:
     * - DeviceNumber
     * - BusNumber
     * - SegmentNumber
     * - Reserved1
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DeviceNumber {
        get => (this._bitfield2 >> 0) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 0) | (this._bitfield2 & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    BusNumber {
        get => (this._bitfield2 >> 8) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 8) | (this._bitfield2 & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    SegmentNumber {
        get => (this._bitfield2 >> 16) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 16) | (this._bitfield2 & ~(0xFF << 16))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield2 >> 24) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 24) | (this._bitfield2 & ~(0xFF << 24))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
