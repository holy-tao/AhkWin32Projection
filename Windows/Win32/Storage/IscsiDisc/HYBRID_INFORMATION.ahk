#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\NVCACHE_PRIORITY_LEVEL_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class HYBRID_INFORMATION extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    class _Attributes extends Win32Struct {
        static sizeof => 88
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - WriteCacheChangeable
         * - WriteThroughIoSupported
         * - FlushCacheSupported
         * - Removable
         * - ReservedBits
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        WriteCacheChangeable {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        WriteThroughIoSupported {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        FlushCacheSupported {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
        /**
         * @type {Integer}
         */
        Removable {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    
        /**
         * @type {Integer}
         */
        ReservedBits {
            get => (this._bitfield >> 4) & 0xFFFFFFF
            set => this._bitfield := ((value & 0xFFFFFFF) << 4) | (this._bitfield & ~(0xFFFFFFF << 4))
        }
    
    }

    class _Priorities extends Win32Struct {
        static sizeof => 88
        static packingSize => 8

        class _SupportedCommands extends Win32Struct {
            static sizeof => 40
            static packingSize => 8
    
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
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
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
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            MaxLbaRangeCountForEvict {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            MaxLbaRangeCountForChangeLba {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
        }
    
        /**
         * @type {Integer}
         */
        PriorityLevelCount {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {BOOLEAN}
         */
        MaxPriorityBehavior{
            get {
                if(!this.HasProp("__MaxPriorityBehavior"))
                    this.__MaxPriorityBehavior := BOOLEAN(this.ptr + 1)
                return this.__MaxPriorityBehavior
            }
        }
    
        /**
         * @type {Integer}
         */
        OptimalWriteGranularity {
            get => NumGet(this, 2, "char")
            set => NumPut("char", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => NumGet(this, 3, "char")
            set => NumPut("char", value, this, 3)
        }
    
        /**
         * @type {Integer}
         */
        DirtyThresholdLow {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        DirtyThresholdHigh {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {_SupportedCommands}
         */
        SupportedCommands{
            get {
                if(!this.HasProp("__SupportedCommands"))
                    this.__SupportedCommands := %this.__Class%._SupportedCommands(this.ptr + 16)
                return this.__SupportedCommands
            }
        }
    
        /**
         * @type {Array<NVCACHE_PRIORITY_LEVEL_DESCRIPTOR>}
         */
        Priority{
            get {
                if(!this.HasProp("__PriorityProxyArray"))
                    this.__PriorityProxyArray := Win32FixedArray(this.ptr + 32, 1, NVCACHE_PRIORITY_LEVEL_DESCRIPTOR, "")
                return this.__PriorityProxyArray
            }
        }
    
    }

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
     * @type {BOOLEAN}
     */
    HybridSupported{
        get {
            if(!this.HasProp("__HybridSupported"))
                this.__HybridSupported := BOOLEAN(this.ptr + 8)
            return this.__HybridSupported
        }
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
     * @type {_Attributes}
     */
    Attributes{
        get {
            if(!this.HasProp("__Attributes"))
                this.__Attributes := %this.__Class%._Attributes(this.ptr + 40)
            return this.__Attributes
        }
    }

    /**
     * @type {_Priorities}
     */
    Priorities{
        get {
            if(!this.HasProp("__Priorities"))
                this.__Priorities := %this.__Class%._Priorities(this.ptr + 48)
            return this.__Priorities
        }
    }
}
