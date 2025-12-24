#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_QUERYSTATISTICS_SEGMENT_INFORMATION extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    class _PowerFlags extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - PreservedDuringStandby
         * - PreservedDuringHibernate
         * - PartiallyPreservedDuringHibernate
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        PreservedDuringStandby {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        PreservedDuringHibernate {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        PartiallyPreservedDuringHibernate {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
    }

    class _SegmentProperties extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - SystemMemory
         * - PopulatedByReservedDDRByFirmware
         * - SegmentType
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        SystemMemory {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        PopulatedByReservedDDRByFirmware {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        SegmentType {
            get => (this._bitfield >> 2) & 0xF
            set => this._bitfield := ((value & 0xF) << 2) | (this._bitfield & ~(0xF << 2))
        }
    
    }

    /**
     * @type {Integer}
     */
    CommitLimit {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    BytesCommitted {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    BytesResident {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_MEMORY>}
     */
    Memory {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Aperture {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Array<UInt64>}
     */
    TotalBytesEvictedByPriority{
        get {
            if(!this.HasProp("__TotalBytesEvictedByPriorityProxyArray"))
                this.__TotalBytesEvictedByPriorityProxyArray := Win32FixedArray(this.ptr + 40, 5, Primitive, "uint")
            return this.__TotalBytesEvictedByPriorityProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    SystemMemoryEndAddress {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {_PowerFlags}
     */
    PowerFlags{
        get {
            if(!this.HasProp("__PowerFlags"))
                this.__PowerFlags := %this.__Class%._PowerFlags(88, this)
            return this.__PowerFlags
        }
    }

    /**
     * @type {_SegmentProperties}
     */
    SegmentProperties{
        get {
            if(!this.HasProp("__SegmentProperties"))
                this.__SegmentProperties := %this.__Class%._SegmentProperties(96, this)
            return this.__SegmentProperties
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 104, 5, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
