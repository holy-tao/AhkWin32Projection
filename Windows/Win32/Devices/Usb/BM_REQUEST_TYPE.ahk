#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct BM_REQUEST_TYPE {
    #StructPack 1


    struct _BM {
        /**
         * This bitfield backs the following members:
         * - Recipient
         * - Reserved
         * - Type
         * - Dir
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        Recipient {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }

        /**
         * @type {Integer}
         */
        Type {
            get => (this._bitfield >> 5) & 0x3
            set => this._bitfield := ((value & 0x3) << 5) | (this._bitfield & ~(0x3 << 5))
        }

        /**
         * @type {Integer}
         */
        Dir {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    }

    s : BM_REQUEST_TYPE._BM

    static __New() {
        DefineProp(this.Prototype, 'B', { type: Int8, offset: 0 })
        this.DeleteProp("__New")
    }
}
