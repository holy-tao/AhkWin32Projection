#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Kernel
 * @version v4.0.30319
 */
class SLIST_HEADER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class _HeaderX64 extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - Depth
         * - Sequence
         * @type {Integer}
         */
        _bitfield1 {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Depth {
            get => (this._bitfield1 >> 0) & 0xFFFF
            set => this._bitfield1 := ((value & 0xFFFF) << 0) | (this._bitfield1 & ~(0xFFFF << 0))
        }
    
        /**
         * @type {Integer}
         */
        Sequence {
            get => (this._bitfield1 >> 16) & 0xFFFFFFFFFFFF
            set => this._bitfield1 := ((value & 0xFFFFFFFFFFFF) << 16) | (this._bitfield1 & ~(0xFFFFFFFFFFFF << 16))
        }
    
        /**
         * This bitfield backs the following members:
         * - Reserved
         * - NextEntry
         * @type {Integer}
         */
        _bitfield2 {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        NextEntry {
            get => (this._bitfield2 >> 4) & 0xFFFFFFFFFFFFFFF
            set => this._bitfield2 := ((value & 0xFFFFFFFFFFFFFFF) << 4) | (this._bitfield2 & ~(0xFFFFFFFFFFFFFFF << 4))
        }
    
    }

    /**
     * @type {Integer}
     */
    Alignment {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Region {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {_HeaderX64}
     */
    HeaderX64{
        get {
            if(!this.HasProp("__HeaderX64"))
                this.__HeaderX64 := %this.__Class%._HeaderX64(0, this)
            return this.__HeaderX64
        }
    }
}
