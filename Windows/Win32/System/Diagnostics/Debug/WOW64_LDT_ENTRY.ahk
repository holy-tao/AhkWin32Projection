#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes an entry in the descriptor table for a 32-bit thread on a 64-bit system. This structure is valid only on 64-bit systems.
 * @remarks
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-wow64getthreadselectorentry">Wow64GetThreadSelectorEntry</a> function fills this structure with information from an entry in the descriptor table. You can use this information to convert a segment-relative address to a linear virtual address.
 * 
 * The base address of a segment is the address of offset 0 in the segment. To calculate this value, combine the <b>BaseLow</b>, <b>BaseMid</b>, and <b>BaseHi</b> members.
 * 
 * The limit of a segment is the address of the last byte that can be addressed in the segment. To calculate this value, combine the <b>LimitLow</b> and <b>LimitHi</b> members.
 * 
 * The <b>WOW64_LDT_ENTRY</b> structure has the same layout for a 64-bit process as the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ldt_entry">LDT_ENTRY</a> structure has for a 32-bit process.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-wow64_ldt_entry
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WOW64_LDT_ENTRY {
    #StructPack 4


    struct _HighWord {

        struct _Bytes {
            BaseMid : Int8

            Flags1 : Int8

            Flags2 : Int8

            BaseHi : Int8

        }

        struct _Bits {
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
             */
            _bitfield : Int32


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

        Bytes : WOW64_LDT_ENTRY._HighWord._Bytes

        static __New() {
            DefineProp(this.Prototype, 'Bits', { type: WOW64_LDT_ENTRY._HighWord._Bits, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * The low-order part of the address of the last byte in the segment.
     */
    LimitLow : UInt16

    /**
     * The low-order part of the base address of the segment.
     */
    BaseLow : UInt16

    /**
     * The high-order portion of the descriptor. This member may be interpreted as bytes or collections of bits, depending on the level of detail required.
     */
    HighWord : WOW64_LDT_ENTRY._HighWord

}
