#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_PACKET_8021Q_INFO {
    #StructPack 8


    struct _TagHeader {
        /**
         * This bitfield backs the following members:
         * - UserPriority
         * - CanonicalFormatId
         * - VlanId
         * - Reserved
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        UserPriority {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }

        /**
         * @type {Integer}
         */
        CanonicalFormatId {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        VlanId {
            get => (this._bitfield >> 4) & 0xFFF
            set => this._bitfield := ((value & 0xFFF) << 4) | (this._bitfield & ~(0xFFF << 4))
        }
    }

    TagHeader : NDIS_PACKET_8021Q_INFO._TagHeader

    static __New() {
        DefineProp(this.Prototype, 'Value', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
