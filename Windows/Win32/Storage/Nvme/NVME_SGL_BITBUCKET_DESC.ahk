#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_SGL_BITBUCKET_DESC {
    #StructPack 8


    struct _Identifier {
        /**
         * This bitfield backs the following members:
         * - SubType
         * - Type
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        SubType {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }

        /**
         * @type {Integer}
         */
        Type {
            get => (this._bitfield >> 4) & 0xF
            set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUchar', { type: Int8, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Reserved0 : Int64

    Length : UInt32

    Reserved1 : Int8[3]

    Identifier : NVME_SGL_BITBUCKET_DESC._Identifier

}
