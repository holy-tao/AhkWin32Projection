#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_PROPERTY_GET_COMMAND {
    #StructPack 4


    struct _ATTRIB {
        /**
         * This bitfield backs the following members:
         * - PropertySize
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        PropertySize {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }
    }

    OPC : Int8

    Reserved0 : Int8

    CID : UInt16

    FCTYPE : Int8

    Reserved1 : Int8[35]

    ATTRIB : NVMEOF_PROPERTY_GET_COMMAND._ATTRIB

    Reserved2 : Int8[3]

    OFST : UInt32

    Reserved3 : Int8[16]

}
