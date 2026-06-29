#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_SGL_DESC.ahk" { NVME_SGL_DESC }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_CONNECT_COMMAND {
    #StructPack 4


    struct _CATTR {
        /**
         * This bitfield backs the following members:
         * - PriorityClass
         * - SqFlowControlDisable
         * - IoQueueDeletion
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        PriorityClass {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }

        /**
         * @type {Integer}
         */
        SqFlowControlDisable {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        IoQueueDeletion {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUchar', { type: Int8, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    OPC : Int8

    Reserved0 : Int8

    CID : UInt16

    FCTYPE : Int8

    Reserved1 : Int8[19]

    SGL1 : NVME_SGL_DESC

    RECFMT : UInt16

    QID : UInt16

    SQSIZE : UInt16

    CATTR : NVMEOF_CONNECT_COMMAND._CATTR

    Reserved2 : Int8

    KATO : UInt32

    Reserved3 : Int8[12]

}
