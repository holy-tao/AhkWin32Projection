#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_REINITIALIZE_MEDIA_INPUT {
    #StructPack 4


    struct _Options {
        /**
         * This bitfield backs the following members:
         * - Overwrite
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        Overwrite {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    Version : UInt32

    Size : UInt32

    Options : SCM_PD_REINITIALIZE_MEDIA_INPUT._Options

}
