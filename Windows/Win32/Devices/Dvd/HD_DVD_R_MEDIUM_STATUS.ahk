#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class HD_DVD_R_MEDIUM_STATUS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * This bitfield backs the following members:
     * - ExtendedTestZone
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
    ExtendedTestZone {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 1) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
    }

    /**
     * @type {Integer}
     */
    NumberOfRemainingRMDsInRDZ {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Array<Byte>}
     */
    NumberOfRemainingRMDsInCurrentRMZ{
        get {
            if(!this.HasProp("__NumberOfRemainingRMDsInCurrentRMZProxyArray"))
                this.__NumberOfRemainingRMDsInCurrentRMZProxyArray := Win32FixedArray(this.ptr + 2, 2, Primitive, "char")
            return this.__NumberOfRemainingRMDsInCurrentRMZProxyArray
        }
    }
}
