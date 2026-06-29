#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_HW_ENDURANCE_INFO {
    #StructPack 4


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - Shared
         * - Reserved
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        Shared {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    ValidFields : UInt32

    GroupId : UInt32

    Flags : STORAGE_HW_ENDURANCE_INFO._Flags

    LifePercentage : UInt32

    BytesReadCount : Int8[16]

    ByteWriteCount : Int8[16]

}
