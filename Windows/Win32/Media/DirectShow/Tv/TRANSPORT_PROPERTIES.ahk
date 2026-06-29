#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct TRANSPORT_PROPERTIES {
    #StructPack 8


    struct _Fields {

        struct _Others {
            /**
             * This bitfield backs the following members:
             * - TransportScramblingControl
             * - Reserved
             */
            _bitfield : Int64


            /**
             * @type {Integer}
             */
            TransportScramblingControl {
                get => (this._bitfield >> 0) & 0xFF
                set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
            }
        }

        Others : TRANSPORT_PROPERTIES._Fields._Others

        static __New() {
            DefineProp(this.Prototype, 'Value', { type: Int64, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    PID : UInt32

    PCR : Int64

    Fields : TRANSPORT_PROPERTIES._Fields

}
