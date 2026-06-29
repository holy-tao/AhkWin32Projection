#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_SLOT_NUMBER {
    #StructPack 4


    struct _u {

        struct _bits {
            /**
             * This bitfield backs the following members:
             * - DeviceNumber
             * - FunctionNumber
             * - Reserved
             */
            _bitfield : Int32


            /**
             * @type {Integer}
             */
            DeviceNumber {
                get => (this._bitfield >> 0) & 0x1F
                set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
            }

            /**
             * @type {Integer}
             */
            FunctionNumber {
                get => (this._bitfield >> 5) & 0x7
                set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
            }
        }

        bits : PCI_SLOT_NUMBER._u._bits

        static __New() {
            DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    u : PCI_SLOT_NUMBER._u

}
