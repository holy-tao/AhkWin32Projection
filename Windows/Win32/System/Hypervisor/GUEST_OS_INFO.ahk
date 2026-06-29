#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct GUEST_OS_INFO {
    #StructPack 8


    struct _ClosedSource {
        /**
         * This bitfield backs the following members:
         * - BuildNumber
         * - ServiceVersion
         * - MinorVersion
         * - MajorVersion
         * - OsId
         * - VendorId
         */
        _bitfield : Int64


        /**
         * @type {Integer}
         */
        BuildNumber {
            get => (this._bitfield >> 0) & 0xFFFF
            set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
        }

        /**
         * @type {Integer}
         */
        ServiceVersion {
            get => (this._bitfield >> 16) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 16) | (this._bitfield & ~(0xFF << 16))
        }

        /**
         * @type {Integer}
         */
        MinorVersion {
            get => (this._bitfield >> 24) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
        }

        /**
         * @type {Integer}
         */
        MajorVersion {
            get => (this._bitfield >> 32) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 32) | (this._bitfield & ~(0xFF << 32))
        }

        /**
         * @type {Integer}
         */
        OsId {
            get => (this._bitfield >> 40) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 40) | (this._bitfield & ~(0xFF << 40))
        }

        /**
         * @type {Integer}
         */
        VendorId {
            get => (this._bitfield >> 48) & 0xFFFF
            set => this._bitfield := ((value & 0xFFFF) << 48) | (this._bitfield & ~(0xFFFF << 48))
        }
    }

    struct _OpenSource {
        /**
         * This bitfield backs the following members:
         * - VendorSpecific1
         * - Version
         * - VendorSpecific2
         * - OsId
         * - IsOpenSource
         */
        _bitfield : Int64


        /**
         * @type {Integer}
         */
        VendorSpecific1 {
            get => (this._bitfield >> 0) & 0xFFFF
            set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
        }

        /**
         * @type {Integer}
         */
        Version {
            get => (this._bitfield >> 16) & 0xFFFFFFFF
            set => this._bitfield := ((value & 0xFFFFFFFF) << 16) | (this._bitfield & ~(0xFFFFFFFF << 16))
        }

        /**
         * @type {Integer}
         */
        VendorSpecific2 {
            get => (this._bitfield >> 48) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 48) | (this._bitfield & ~(0xFF << 48))
        }

        /**
         * @type {Integer}
         */
        OsId {
            get => (this._bitfield >> 56) & 0x7F
            set => this._bitfield := ((value & 0x7F) << 56) | (this._bitfield & ~(0x7F << 56))
        }

        /**
         * @type {Integer}
         */
        IsOpenSource {
            get => (this._bitfield >> 63) & 0x1
            set => this._bitfield := ((value & 0x1) << 63) | (this._bitfield & ~(0x1 << 63))
        }
    }

    AsUINT64 : Int64

    static __New() {
        DefineProp(this.Prototype, 'ClosedSource', { type: GUEST_OS_INFO._ClosedSource, offset: 0 })
        DefineProp(this.Prototype, 'OpenSource', { type: GUEST_OS_INFO._OpenSource, offset: 0 })
        this.DeleteProp("__New")
    }
}
