#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DVD_DISC_CONTROL_BLOCK_HEADER.ahk" { DVD_DISC_CONTROL_BLOCK_HEADER }

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_DISC_CONTROL_BLOCK_WRITE_INHIBIT {
    #StructPack 1


    struct _WriteProtectActions {
        ReservedDoNotUse_UseAsByteInstead_0 : Int8[3]

        /**
         * This bitfield backs the following members:
         * - WriteProtectStatus
         * - ReservedDoNotUse_UseAsByteInstead_1
         * - UpdateRequiresPassword
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        WriteProtectStatus {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }

        /**
         * @type {Integer}
         */
        ReservedDoNotUse_UseAsByteInstead_1 {
            get => (this._bitfield >> 2) & 0x1F
            set => this._bitfield := ((value & 0x1F) << 2) | (this._bitfield & ~(0x1F << 2))
        }

        /**
         * @type {Integer}
         */
        UpdateRequiresPassword {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsByte', { type: Int8[4], offset: 0 })
            this.DeleteProp("__New")
        }
    }

    header : DVD_DISC_CONTROL_BLOCK_HEADER

    UpdateCount : Int8[4]

    WriteProtectActions : DVD_DISC_CONTROL_BLOCK_WRITE_INHIBIT._WriteProtectActions

    Reserved0 : Int8[16]

    UpdatePassword : Int8[32]

    Reserved1 : Int8[32672]

}
