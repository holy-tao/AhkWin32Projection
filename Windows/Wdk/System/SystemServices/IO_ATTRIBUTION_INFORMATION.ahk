#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_ATTRIBUTION_INFORMATION {
    #StructPack 8


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - MajorCode
         * - IoStart
         * - QueueOnly
         * - IoFailed
         * - VirtualDevice
         * - Spare
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        MajorCode {
            get => (this._bitfield >> 0) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
        }

        /**
         * @type {Integer}
         */
        IoStart {
            get => (this._bitfield >> 8) & 0x1
            set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
        }

        /**
         * @type {Integer}
         */
        QueueOnly {
            get => (this._bitfield >> 9) & 0x1
            set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
        }

        /**
         * @type {Integer}
         */
        IoFailed {
            get => (this._bitfield >> 10) & 0x1
            set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
        }

        /**
         * @type {Integer}
         */
        VirtualDevice {
            get => (this._bitfield >> 11) & 0x1
            set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
        }

        /**
         * @type {Integer}
         */
        Spare {
            get => (this._bitfield >> 12) & 0xFFFFF
            set => this._bitfield := ((value & 0xFFFFF) << 12) | (this._bitfield & ~(0xFFFFF << 12))
        }
        static __New() {
            DefineProp(this.Prototype, 'AllFlags', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Version : UInt32

    Flags : IO_ATTRIBUTION_INFORMATION._Flags

    Length : UInt32

    ServiceStartTime : Int64

    CurrentTime : Int64

}
