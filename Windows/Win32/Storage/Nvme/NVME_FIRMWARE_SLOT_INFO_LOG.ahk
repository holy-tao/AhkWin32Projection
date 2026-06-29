#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains fields that specify the information in the Firmware Slot Information log page.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_firmware_slot_info_log
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_FIRMWARE_SLOT_INFO_LOG {
    #StructPack 8


    struct _AFI {
        /**
         * This bitfield backs the following members:
         * - ActiveSlot
         * - Reserved0
         * - PendingActivateSlot
         * - Reserved1
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        ActiveSlot {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }

        /**
         * @type {Integer}
         */
        Reserved0 {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        PendingActivateSlot {
            get => (this._bitfield >> 4) & 0x7
            set => this._bitfield := ((value & 0x7) << 4) | (this._bitfield & ~(0x7 << 4))
        }

        /**
         * @type {Integer}
         */
        Reserved1 {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    }

    /**
     * An Active Firmware Information (**AFI**) structure containing fields that specify information about the active firmware revision.
     */
    AFI : NVME_FIRMWARE_SLOT_INFO_LOG._AFI

    /**
     * Bit 3 of the **AFI** structure is reserved.
     */
    Reserved0 : Int8[7]

    /**
     * An array of 7 Firmware Revisions that contain the revision of the firmware downloaded to each of the 7 firmware slots.
     * 
     * The members of the array are named based on the firmware slot number (1-7), such that Firmware Revision for Slot 1 (FRS1) is in position 1, Firmware Revision for Slot 2 (FRS2) is in position 2, and so on, up to Firmware Revision for Slot 7 (FRS7) in position 7.
     * 
     * If no valid firmware revision is present, or if a slot is unsupported, all zeros will be returned for that slot.
     */
    FRS : Int64[7]

    /**
     * Bit 7 of the **AFI** structure is reserved.
     */
    Reserved1 : Int8[448]

}
