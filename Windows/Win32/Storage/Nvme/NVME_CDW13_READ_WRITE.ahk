#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the NVME Read and NVME Write commands that read or write data and metadata, if applicable, to and from the NVM controller for the specified Logical Block Addresses (LBA).
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw13_read_write
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW13_READ_WRITE {
    #StructPack 4


    struct _DSM {
        /**
         * This bitfield backs the following members:
         * - AccessFrequency
         * - AccessLatency
         * - SequentialRequest
         * - Incompressible
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        AccessFrequency {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }

        /**
         * @type {Integer}
         */
        AccessLatency {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }

        /**
         * @type {Integer}
         */
        SequentialRequest {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        Incompressible {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    }

    DSM : NVME_CDW13_READ_WRITE._DSM

    Reserved : Int8

    DSPEC : UInt16

    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
