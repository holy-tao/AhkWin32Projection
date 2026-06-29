#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_DISC_CONTROL_BLOCK_HEADER {
    #StructPack 1


    struct _ProhibitedActions {
        ReservedDoNotUse_UseAsByteInstead_0 : Int8[3]

        /**
         * This bitfield backs the following members:
         * - RecordingWithinTheUserDataArea
         * - ReadingDiscControlBlocks
         * - FormattingTheMedium
         * - ModificationOfThisDiscControlBlock
         * - ReservedDoNotUse_UseAsByteInstead_1
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        RecordingWithinTheUserDataArea {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        ReadingDiscControlBlocks {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        FormattingTheMedium {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        ModificationOfThisDiscControlBlock {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        ReservedDoNotUse_UseAsByteInstead_1 {
            get => (this._bitfield >> 4) & 0xF
            set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsByte', { type: Int8[4], offset: 0 })
            this.DeleteProp("__New")
        }
    }

    ContentDescriptor : Int8[4]

    ProhibitedActions : DVD_DISC_CONTROL_BLOCK_HEADER._ProhibitedActions

    VendorId : Int8[32]

}
