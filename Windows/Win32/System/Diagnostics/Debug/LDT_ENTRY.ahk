#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes an entry in the descriptor table. This structure is valid only on x86-based systems.
 * @remarks
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getthreadselectorentry">GetThreadSelectorEntry</a> function fills this structure with information from an entry in the descriptor table. You can use this information to convert a segment-relative address to a linear virtual address.
 * 
 * The base address of a segment is the address of offset 0 in the segment. To calculate this value, combine the <b>BaseLow</b>, <b>BaseMid</b>, and <b>BaseHi</b> members.
 * 
 * The limit of a segment is the address of the last byte that can be addressed in the segment. To calculate this value, combine the <b>LimitLow</b> and <b>LimitHi</b> members.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-ldt_entry
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class LDT_ENTRY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    class _HighWord_e__Union extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        class _Bytes extends Win32Struct {
            static sizeof => 4
            static packingSize => 1
    
            /**
             * @type {Integer}
             */
            BaseMid {
                get => NumGet(this, 0, "char")
                set => NumPut("char", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Flags1 {
                get => NumGet(this, 1, "char")
                set => NumPut("char", value, this, 1)
            }
        
            /**
             * @type {Integer}
             */
            Flags2 {
                get => NumGet(this, 2, "char")
                set => NumPut("char", value, this, 2)
            }
        
            /**
             * @type {Integer}
             */
            BaseHi {
                get => NumGet(this, 3, "char")
                set => NumPut("char", value, this, 3)
            }
        
        }
    
        class _Bits extends Win32Struct {
            static sizeof => 4
            static packingSize => 4
    
            /**
             * This bitfield backs the following members:
             * - BaseMid
             * - Type
             * - Dpl
             * - Pres
             * - LimitHi
             * - Sys
             * - Reserved_0
             * - Default_Big
             * - Granularity
             * - BaseHi
             * @type {Integer}
             */
            _bitfield {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            BaseMid {
                get => (this._bitfield >> 0) & 0xFF
                set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
            }
        
            /**
             * @type {Integer}
             */
            Type {
                get => (this._bitfield >> 8) & 0x1F
                set => this._bitfield := ((value & 0x1F) << 8) | (this._bitfield & ~(0x1F << 8))
            }
        
            /**
             * @type {Integer}
             */
            Dpl {
                get => (this._bitfield >> 13) & 0x3
                set => this._bitfield := ((value & 0x3) << 13) | (this._bitfield & ~(0x3 << 13))
            }
        
            /**
             * @type {Integer}
             */
            Pres {
                get => (this._bitfield >> 15) & 0x1
                set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
            }
        
            /**
             * @type {Integer}
             */
            LimitHi {
                get => (this._bitfield >> 16) & 0xF
                set => this._bitfield := ((value & 0xF) << 16) | (this._bitfield & ~(0xF << 16))
            }
        
            /**
             * @type {Integer}
             */
            Sys {
                get => (this._bitfield >> 20) & 0x1
                set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
            }
        
            /**
             * @type {Integer}
             */
            Reserved_0 {
                get => (this._bitfield >> 21) & 0x1
                set => this._bitfield := ((value & 0x1) << 21) | (this._bitfield & ~(0x1 << 21))
            }
        
            /**
             * @type {Integer}
             */
            Default_Big {
                get => (this._bitfield >> 22) & 0x1
                set => this._bitfield := ((value & 0x1) << 22) | (this._bitfield & ~(0x1 << 22))
            }
        
            /**
             * @type {Integer}
             */
            Granularity {
                get => (this._bitfield >> 23) & 0x1
                set => this._bitfield := ((value & 0x1) << 23) | (this._bitfield & ~(0x1 << 23))
            }
        
            /**
             * @type {Integer}
             */
            BaseHi {
                get => (this._bitfield >> 24) & 0xFF
                set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
            }
        
        }
    
        /**
         * @type {_Bytes}
         */
        Bytes{
            get {
                if(!this.HasProp("__Bytes"))
                    this.__Bytes := %this.__Class%._Bytes(0, this)
                return this.__Bytes
            }
        }
    
        /**
         * @type {_Bits}
         */
        Bits{
            get {
                if(!this.HasProp("__Bits"))
                    this.__Bits := %this.__Class%._Bits(0, this)
                return this.__Bits
            }
        }
    
    }

    /**
     * The low-order part of the address of the last byte in the segment.
     * @type {Integer}
     */
    LimitLow {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The low-order part of the base address of the segment.
     * @type {Integer}
     */
    BaseLow {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The high-order portion of the descriptor. This member may be interpreted as bytes or collections of bits, depending on the level of detail required.
     * @type {_HighWord_e__Union}
     */
    HighWord{
        get {
            if(!this.HasProp("__HighWord"))
                this.__HighWord := %this.__Class%._HighWord_e__Union(4, this)
            return this.__HighWord
        }
    }
}
