#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_SEGMENT_BUS_NUMBER {
    #StructPack 4


    struct _u {

        struct _bits {
            /**
             * This bitfield backs the following members:
             * - BusNumber
             * - SegmentNumber
             * - Reserved
             */
            _bitfield : Int32


            /**
             * @type {Integer}
             */
            BusNumber {
                get => (this._bitfield >> 0) & 0xFF
                set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
            }

            /**
             * @type {Integer}
             */
            SegmentNumber {
                get => (this._bitfield >> 8) & 0xFFFF
                set => this._bitfield := ((value & 0xFFFF) << 8) | (this._bitfield & ~(0xFFFF << 8))
            }
        }

        bits : PCI_SEGMENT_BUS_NUMBER._u._bits

        static __New() {
            DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    u : PCI_SEGMENT_BUS_NUMBER._u

}
