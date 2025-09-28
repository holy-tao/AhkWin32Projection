#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVCACHE_PRIORITY_LEVEL_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class HYBRID_INFORMATION extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    HybridSupported {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    CacheTypeEffective {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    CacheTypeDefault {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    FractionBase {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    CacheSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    PriorityLevelCount {
        get => NumGet(this, 48, "char")
        set => NumPut("char", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    MaxPriorityBehavior {
        get => NumGet(this, 49, "char")
        set => NumPut("char", value, this, 49)
    }

    /**
     * @type {Integer}
     */
    OptimalWriteGranularity {
        get => NumGet(this, 50, "char")
        set => NumPut("char", value, this, 50)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 51, "char")
        set => NumPut("char", value, this, 51)
    }

    /**
     * @type {Integer}
     */
    DirtyThresholdLow {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    DirtyThresholdHigh {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * This bitfield backs the following members:
     * - CacheDisable
     * - SetDirtyThreshold
     * - PriorityDemoteBySize
     * - PriorityChangeByLbaRange
     * - Evict
     * - ReservedBits
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CacheDisable {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    SetDirtyThreshold {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    PriorityDemoteBySize {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    PriorityChangeByLbaRange {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Evict {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    ReservedBits {
        get => (this._bitfield >> 5) & 0x7FFFFFF
        set => this._bitfield := ((value & 0x7FFFFFF) << 5) | (this._bitfield & ~(0x7FFFFFF << 5))
    }

    /**
     * @type {Integer}
     */
    MaxEvictCommands {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    MaxLbaRangeCountForEvict {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    MaxLbaRangeCountForChangeLba {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Array<NVCACHE_PRIORITY_LEVEL_DESCRIPTOR>}
     */
    Priority{
        get {
            if(!this.HasProp("__PriorityProxyArray"))
                this.__PriorityProxyArray := Win32FixedArray(this.ptr + 80, 1, NVCACHE_PRIORITY_LEVEL_DESCRIPTOR, "")
            return this.__PriorityProxyArray
        }
    }
}
