#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_FEATURE_SUPPORT {
    #StructPack 8


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - StorMQMiniportsSupported
         * - Reserved
         */
        _bitfield : Int64


        /**
         * @type {Integer}
         */
        StorMQMiniportsSupported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUlonglong', { type: Int64, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Size : UInt32

    Version : UInt32

    Flags : STORAGE_FEATURE_SUPPORT._Flags

    Reserved : Int64[6]

}
