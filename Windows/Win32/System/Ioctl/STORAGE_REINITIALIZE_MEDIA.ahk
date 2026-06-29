#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_REINITIALIZE_MEDIA {
    #StructPack 4


    struct _SanitizeOption {
        /**
         * This bitfield backs the following members:
         * - SanitizeMethod
         * - DisallowUnrestrictedSanitizeExit
         * - Reserved
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        SanitizeMethod {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }

        /**
         * @type {Integer}
         */
        DisallowUnrestrictedSanitizeExit {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    }

    Version : UInt32

    Size : UInt32

    TimeoutInSeconds : UInt32

    SanitizeOption : STORAGE_REINITIALIZE_MEDIA._SanitizeOption

}
