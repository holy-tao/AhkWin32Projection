#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_COPYRIGHT_MANAGEMENT_DESCRIPTOR {
    #StructPack 1


    struct _Dvdrom {
        /**
         * This bitfield backs the following members:
         * - CopyProtectionMode
         * - ContentGenerationManagementSystem
         * - CopyProtectedSector
         * - CopyProtectedMaterial
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        CopyProtectionMode {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }

        /**
         * @type {Integer}
         */
        ContentGenerationManagementSystem {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }

        /**
         * @type {Integer}
         */
        CopyProtectedSector {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        CopyProtectedMaterial {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    }

    struct _DvdRecordable_Version1 {
        /**
         * This bitfield backs the following members:
         * - Reserved0001
         * - ContentGenerationManagementSystem
         * - Reserved0002
         * - CopyProtectedMaterial
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        Reserved0001 {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }

        /**
         * @type {Integer}
         */
        ContentGenerationManagementSystem {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }

        /**
         * @type {Integer}
         */
        Reserved0002 {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        CopyProtectedMaterial {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    }

    struct _Dvdram {
        Reserved0003 : Int8

    }

    struct _DvdRecordable {
        /**
         * This bitfield backs the following members:
         * - Reserved0004
         * - ADP_TY
         * - Reserved0005
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        Reserved0004 {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }

        /**
         * @type {Integer}
         */
        ADP_TY {
            get => (this._bitfield >> 2) & 0x3
            set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
        }

        /**
         * @type {Integer}
         */
        Reserved0005 {
            get => (this._bitfield >> 4) & 0xF
            set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
        }
    }

    Dvdrom : DVD_COPYRIGHT_MANAGEMENT_DESCRIPTOR._Dvdrom

    Reserved0 : Int8[3]

    static __New() {
        DefineProp(this.Prototype, 'DvdRecordable_Version1', { type: DVD_COPYRIGHT_MANAGEMENT_DESCRIPTOR._DvdRecordable_Version1, offset: 0 })
        DefineProp(this.Prototype, 'Dvdram', { type: DVD_COPYRIGHT_MANAGEMENT_DESCRIPTOR._Dvdram, offset: 0 })
        DefineProp(this.Prototype, 'DvdRecordable', { type: DVD_COPYRIGHT_MANAGEMENT_DESCRIPTOR._DvdRecordable, offset: 0 })
        DefineProp(this.Prototype, 'CPR_MAI', { type: Int8, offset: 0 })
        this.DeleteProp("__New")
    }
}
