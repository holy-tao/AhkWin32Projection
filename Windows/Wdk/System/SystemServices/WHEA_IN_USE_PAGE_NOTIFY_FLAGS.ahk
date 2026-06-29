#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_IN_USE_PAGE_NOTIFY_FLAGS {
    #StructPack 1


    struct _Bits {
        /**
         * This bitfield backs the following members:
         * - PlatformDirected
         * - Reserved
         * - NotifyAllOfflines
         * - PageOfflined
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        PlatformDirected {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        NotifyAllOfflines {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        PageOfflined {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    }

    Bits : WHEA_IN_USE_PAGE_NOTIFY_FLAGS._Bits

    static __New() {
        DefineProp(this.Prototype, 'AsUCHAR', { type: Int8, offset: 0 })
        this.DeleteProp("__New")
    }
}
