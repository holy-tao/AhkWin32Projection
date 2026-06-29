#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_REGISTERED_CONTROLLER_DATA {
    #StructPack 8


    struct _RCSTS {
        /**
         * This bitfield backs the following members:
         * - HoldReservation
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        HoldReservation {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    CNTLID : UInt16

    RCSTS : NVME_REGISTERED_CONTROLLER_DATA._RCSTS

    Reserved : Int8[5]

    HOSTID : Int8[8]

    RKEY : Int64

}
