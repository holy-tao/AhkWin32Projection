#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_LBA_ZONE_FORMAT.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_IDENTIFY_SPECIFIC_NAMESPACE_IO_COMMAND_SET extends Win32Struct
{
    static sizeof => 3968

    static packingSize => 8

    class _ZOC extends Win32Struct {
        static sizeof => 2
        static packingSize => 2

        /**
         * This bitfield backs the following members:
         * - VariableZoneCapacity
         * - ZoneExcursions
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        VariableZoneCapacity {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        ZoneExcursions {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
    }

    class _OZCS extends Win32Struct {
        static sizeof => 2
        static packingSize => 2

        /**
         * This bitfield backs the following members:
         * - ReadAcrossZoneBoundaries
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ReadAcrossZoneBoundaries {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
    }

    /**
     * @type {_ZOC}
     */
    ZOC{
        get {
            if(!this.HasProp("__ZOC"))
                this.__ZOC := %this.__Class%._ZOC(0, this)
            return this.__ZOC
        }
    }

    /**
     * @type {_OZCS}
     */
    OZCS{
        get {
            if(!this.HasProp("__OZCS"))
                this.__OZCS := %this.__Class%._OZCS(2, this)
            return this.__OZCS
        }
    }

    /**
     * @type {Integer}
     */
    MAR {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MOR {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    RRL {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    FRL {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 20, 2796, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Array<NVME_LBA_ZONE_FORMAT>}
     */
    LBAEF{
        get {
            if(!this.HasProp("__LBAEFProxyArray"))
                this.__LBAEFProxyArray := Win32FixedArray(this.ptr + 2816, 16, NVME_LBA_ZONE_FORMAT, "")
            return this.__LBAEFProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 2944, 768, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    VS{
        get {
            if(!this.HasProp("__VSProxyArray"))
                this.__VSProxyArray := Win32FixedArray(this.ptr + 3712, 256, Primitive, "char")
            return this.__VSProxyArray
        }
    }
}
