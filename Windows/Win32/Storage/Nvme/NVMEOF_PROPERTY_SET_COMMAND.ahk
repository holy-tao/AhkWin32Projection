#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_PROPERTY_SET_COMMAND {
    #StructPack 8


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

    struct _VALUE {

        struct _FourBytes {
            Value : UInt32

            Reserved : UInt32

        }

        FourBytes : NVMEOF_PROPERTY_SET_COMMAND._VALUE._FourBytes

        static __New() {
            DefineProp(this.Prototype, 'EightBytes', { type: Int64, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    OPC : Int8

    Reserved0 : Int8

    CID : UInt16

    FCTYPE : Int8

    Reserved1 : Int8[35]

    ATTRIB : NVMEOF_PROPERTY_SET_COMMAND._ATTRIB

    Reserved2 : Int8[3]

    OFST : UInt32

    VALUE : NVMEOF_PROPERTY_SET_COMMAND._VALUE

    Reserved3 : Int8[8]

}
