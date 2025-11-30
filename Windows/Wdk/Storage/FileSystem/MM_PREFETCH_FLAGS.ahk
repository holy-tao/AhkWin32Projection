#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class MM_PREFETCH_FLAGS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    class _Flags extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - Priority
         * - RepurposePriority
         * - PriorityProtection
         * - MustBeZero
         * - CannotBeUsedAsFlags
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Priority {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }
    
        /**
         * @type {Integer}
         */
        RepurposePriority {
            get => (this._bitfield >> 3) & 0x7
            set => this._bitfield := ((value & 0x7) << 3) | (this._bitfield & ~(0x7 << 3))
        }
    
        /**
         * @type {Integer}
         */
        PriorityProtection {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }
    
        /**
         * @type {Integer}
         */
        MustBeZero {
            get => (this._bitfield >> 7) & 0x3
            set => this._bitfield := ((value & 0x3) << 7) | (this._bitfield & ~(0x3 << 7))
        }
    
        /**
         * @type {Integer}
         */
        CannotBeUsedAsFlags {
            get => (this._bitfield >> 9) & 0x7FFFFF
            set => this._bitfield := ((value & 0x7FFFFF) << 9) | (this._bitfield & ~(0x7FFFFF << 9))
        }
    
    }

    /**
     * @type {_Flags}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := %this.__Class%._Flags(0, this)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    AllFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
