#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_AGP_CAPABILITY {
    #StructPack 8


    struct _PCI_AGP_STATUS {
        /**
         * This bitfield backs the following members:
         * - Rate
         * - Agp3Mode
         * - FastWrite
         * - FourGB
         * - HostTransDisable
         * - Gart64
         * - ITA_Coherent
         * - SideBandAddressing
         * - CalibrationCycle
         * - AsyncRequestSize
         * - Rsvd1
         * - Isoch
         * - Rsvd2
         * - RequestQueueDepthMaximum
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        Rate {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }

        /**
         * @type {Integer}
         */
        Agp3Mode {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        FastWrite {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        FourGB {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }

        /**
         * @type {Integer}
         */
        HostTransDisable {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        Gart64 {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }

        /**
         * @type {Integer}
         */
        ITA_Coherent {
            get => (this._bitfield >> 8) & 0x1
            set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
        }

        /**
         * @type {Integer}
         */
        SideBandAddressing {
            get => (this._bitfield >> 9) & 0x1
            set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
        }

        /**
         * @type {Integer}
         */
        CalibrationCycle {
            get => (this._bitfield >> 10) & 0x7
            set => this._bitfield := ((value & 0x7) << 10) | (this._bitfield & ~(0x7 << 10))
        }

        /**
         * @type {Integer}
         */
        AsyncRequestSize {
            get => (this._bitfield >> 13) & 0x7
            set => this._bitfield := ((value & 0x7) << 13) | (this._bitfield & ~(0x7 << 13))
        }

        /**
         * @type {Integer}
         */
        Rsvd1 {
            get => (this._bitfield >> 16) & 0x1
            set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
        }

        /**
         * @type {Integer}
         */
        Isoch {
            get => (this._bitfield >> 17) & 0x1
            set => this._bitfield := ((value & 0x1) << 17) | (this._bitfield & ~(0x1 << 17))
        }

        /**
         * @type {Integer}
         */
        Rsvd2 {
            get => (this._bitfield >> 18) & 0x3F
            set => this._bitfield := ((value & 0x3F) << 18) | (this._bitfield & ~(0x3F << 18))
        }

        /**
         * @type {Integer}
         */
        RequestQueueDepthMaximum {
            get => (this._bitfield >> 24) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
        }
    }

    struct _PCI_AGP_COMMAND {
        /**
         * This bitfield backs the following members:
         * - Rate
         * - Rsvd1
         * - FastWriteEnable
         * - FourGBEnable
         * - Rsvd2
         * - Gart64
         * - AGPEnable
         * - SBAEnable
         * - CalibrationCycle
         * - AsyncReqSize
         * - Rsvd3
         * - RequestQueueDepth
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        Rate {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }

        /**
         * @type {Integer}
         */
        Rsvd1 {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        FastWriteEnable {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        FourGBEnable {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }

        /**
         * @type {Integer}
         */
        Rsvd2 {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        Gart64 {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }

        /**
         * @type {Integer}
         */
        AGPEnable {
            get => (this._bitfield >> 8) & 0x1
            set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
        }

        /**
         * @type {Integer}
         */
        SBAEnable {
            get => (this._bitfield >> 9) & 0x1
            set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
        }

        /**
         * @type {Integer}
         */
        CalibrationCycle {
            get => (this._bitfield >> 10) & 0x7
            set => this._bitfield := ((value & 0x7) << 10) | (this._bitfield & ~(0x7 << 10))
        }

        /**
         * @type {Integer}
         */
        AsyncReqSize {
            get => (this._bitfield >> 13) & 0x7
            set => this._bitfield := ((value & 0x7) << 13) | (this._bitfield & ~(0x7 << 13))
        }

        /**
         * @type {Integer}
         */
        Rsvd3 {
            get => (this._bitfield >> 16) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 16) | (this._bitfield & ~(0xFF << 16))
        }

        /**
         * @type {Integer}
         */
        RequestQueueDepth {
            get => (this._bitfield >> 24) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
        }
    }

    Header : IntPtr

    /**
     * This bitfield backs the following members:
     * - Minor
     * - Major
     * - Rsvd1
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    Minor {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    Major {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }

    /**
     * @type {Integer}
     */
    Rsvd1 {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }
    AGPStatus : PCI_AGP_CAPABILITY._PCI_AGP_STATUS

    AGPCommand : PCI_AGP_CAPABILITY._PCI_AGP_COMMAND

}
