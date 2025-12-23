#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class NV_SEP_CACHE_PARAMETER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    class _Flags_e__Union extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        class _CacheFlags extends Win32Struct {
            static sizeof => 1
            static packingSize => 1
    
            /**
             * This bitfield backs the following members:
             * - WriteCacheEnabled
             * - WriteCacheChangeable
             * - WriteThroughIOSupported
             * - FlushCacheSupported
             * - ReservedBits
             * @type {Integer}
             */
            _bitfield {
                get => NumGet(this, 0, "char")
                set => NumPut("char", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            WriteCacheEnabled {
                get => (this._bitfield >> 0) & 0x1
                set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
            }
        
            /**
             * @type {Integer}
             */
            WriteCacheChangeable {
                get => (this._bitfield >> 1) & 0x1
                set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
            }
        
            /**
             * @type {Integer}
             */
            WriteThroughIOSupported {
                get => (this._bitfield >> 2) & 0x1
                set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
            }
        
            /**
             * @type {Integer}
             */
            FlushCacheSupported {
                get => (this._bitfield >> 3) & 0x1
                set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
            }
        
            /**
             * @type {Integer}
             */
            ReservedBits {
                get => (this._bitfield >> 4) & 0xF
                set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
            }
        
        }
    
        /**
         * @type {_CacheFlags}
         */
        CacheFlags{
            get {
                if(!this.HasProp("__CacheFlags"))
                    this.__CacheFlags := %this.__Class%._CacheFlags(0, this)
                return this.__CacheFlags
            }
        }
    
        /**
         * @type {Integer}
         */
        CacheFlagsSet {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
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
     * @type {_Flags_e__Union}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := %this.__Class%._Flags_e__Union(8, this)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    WriteCacheType {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    WriteCacheTypeEffective {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {Array<Byte>}
     */
    ParameterReserve1{
        get {
            if(!this.HasProp("__ParameterReserve1ProxyArray"))
                this.__ParameterReserve1ProxyArray := Win32FixedArray(this.ptr + 11, 3, Primitive, "char")
            return this.__ParameterReserve1ProxyArray
        }
    }
}
