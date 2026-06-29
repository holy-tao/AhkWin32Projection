#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_ERROR_INJECTION_ENTRY {
    #StructPack 2


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - Enable
         * - SingleInstance
         * - Reserved0
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        Enable {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        SingleInstance {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        Reserved0 {
            get => (this._bitfield >> 2) & 0x3F
            set => this._bitfield := ((value & 0x3F) << 2) | (this._bitfield & ~(0x3F << 2))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUchar', { type: Int8, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Flags : NVME_ERROR_INJECTION_ENTRY._Flags

    Reserved1 : Int8

    ErrorInjectionType : UInt16

    ErrorInjectionTypeSpecific : Int8[28]

}
