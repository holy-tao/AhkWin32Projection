#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DSSD_POWER_STATE_DESCRIPTOR.ahk" { DSSD_POWER_STATE_DESCRIPTOR }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_OCP_DEVICE_CAPABILITIES_LOG {
    #StructPack 4


    struct _OobMgmtSupport {
        /**
         * This bitfield backs the following members:
         * - MctpOverSMBusSupported
         * - MctpOverPcieVDMSupported
         * - BasicMgmtCommandSupported
         * - Reserved
         * - CompliesWithSpec
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        MctpOverSMBusSupported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        MctpOverPcieVDMSupported {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        BasicMgmtCommandSupported {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        CompliesWithSpec {
            get => (this._bitfield >> 15) & 0x1
            set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUshort', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _WriteZeroesCommand {
        /**
         * This bitfield backs the following members:
         * - Supported
         * - DEACBitSupported
         * - FUABitSupported
         * - NvmeIo5Met
         * - NvmeIo6Met
         * - Reserved
         * - CompliesWithSpec
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        Supported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        DEACBitSupported {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        FUABitSupported {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        NvmeIo5Met {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        NvmeIo6Met {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        CompliesWithSpec {
            get => (this._bitfield >> 15) & 0x1
            set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUshort', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _SanitizeCommand {
        /**
         * This bitfield backs the following members:
         * - Supported
         * - CryptoEraseSupported
         * - BlockEraseSupported
         * - OverwriteSupported
         * - DeallocateLbaSupported
         * - Reserved
         * - CompliesWithSpec
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        Supported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        CryptoEraseSupported {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        BlockEraseSupported {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        OverwriteSupported {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        DeallocateLbaSupported {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        CompliesWithSpec {
            get => (this._bitfield >> 15) & 0x1
            set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUshort', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _DatasetMgmtCommand {
        /**
         * This bitfield backs the following members:
         * - Supported
         * - AttribDeallocateSupported
         * - Reserved
         * - CompliesWithSpec
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        Supported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        AttribDeallocateSupported {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        CompliesWithSpec {
            get => (this._bitfield >> 15) & 0x1
            set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUshort', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _WriteUncorrectableCommand {
        /**
         * This bitfield backs the following members:
         * - Supported
         * - SingleLBASupported
         * - MaxLBASupported
         * - NvmeIo14Met
         * - Reserved
         * - CompliesWithSpec
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        Supported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        SingleLBASupported {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        MaxLBASupported {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        NvmeIo14Met {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        CompliesWithSpec {
            get => (this._bitfield >> 15) & 0x1
            set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUshort', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _FusedCommand {
        /**
         * This bitfield backs the following members:
         * - CWFusedSupported
         * - Reserved
         * - CompliesWithSpec
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        CWFusedSupported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        CompliesWithSpec {
            get => (this._bitfield >> 15) & 0x1
            set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUshort', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    PciePorts : UInt16

    OobMgmtSupport : NVME_OCP_DEVICE_CAPABILITIES_LOG._OobMgmtSupport

    WriteZeroesCommand : NVME_OCP_DEVICE_CAPABILITIES_LOG._WriteZeroesCommand

    SanitizeCommand : NVME_OCP_DEVICE_CAPABILITIES_LOG._SanitizeCommand

    DatasetMgmtCommand : NVME_OCP_DEVICE_CAPABILITIES_LOG._DatasetMgmtCommand

    WriteUncorrectableCommand : NVME_OCP_DEVICE_CAPABILITIES_LOG._WriteUncorrectableCommand

    FusedCommand : NVME_OCP_DEVICE_CAPABILITIES_LOG._FusedCommand

    MinimumValidDSSDPowerState : UInt16

    Reserved0 : Int8

    DssdDescriptors : DSSD_POWER_STATE_DESCRIPTOR[127]

    Reserved1 : Int8[3934]

    LogPageVersionNumber : UInt16

    LogPageGUID : Guid

}
