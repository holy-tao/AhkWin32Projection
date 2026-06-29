#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_POWER_STATE_DESC.ahk" { NVME_POWER_STATE_DESC }

/**
 * Contains values that indicate controller capabilities, features, command set attributes, and power state descriptors.
 * @remarks
 * The values of the **VID**, **SN**, and **MN** fields may be combined to form a globally unique value that identifies the NVM subsystem.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_identify_controller_data
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_IDENTIFY_CONTROLLER_DATA {
    #StructPack 4


    struct _CMIC {
        /**
         * This bitfield backs the following members:
         * - MultiPorts
         * - MultiControllers
         * - SRIOV
         * - ANAR
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        MultiPorts {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        MultiControllers {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        SRIOV {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        ANAR {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    }

    struct _OAES {
        /**
         * This bitfield backs the following members:
         * - Reserved0
         * - NamespaceAttributeChanged
         * - FirmwareActivation
         * - Reserved1
         * - AsymmetricAccessChanged
         * - PredictableLatencyAggregateLogChanged
         * - LbaStatusChanged
         * - EnduranceGroupAggregateLogChanged
         * - NormalNvmSubsystemShutdown
         * - Reserved2
         * - ZoneInformation
         * - Reserved3
         * - DiscoveryLogChanged
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        Reserved0 {
            get => (this._bitfield >> 0) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
        }

        /**
         * @type {Integer}
         */
        NamespaceAttributeChanged {
            get => (this._bitfield >> 8) & 0x1
            set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
        }

        /**
         * @type {Integer}
         */
        FirmwareActivation {
            get => (this._bitfield >> 9) & 0x1
            set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
        }

        /**
         * @type {Integer}
         */
        Reserved1 {
            get => (this._bitfield >> 10) & 0x1
            set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
        }

        /**
         * @type {Integer}
         */
        AsymmetricAccessChanged {
            get => (this._bitfield >> 11) & 0x1
            set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
        }

        /**
         * @type {Integer}
         */
        PredictableLatencyAggregateLogChanged {
            get => (this._bitfield >> 12) & 0x1
            set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
        }

        /**
         * @type {Integer}
         */
        LbaStatusChanged {
            get => (this._bitfield >> 13) & 0x1
            set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
        }

        /**
         * @type {Integer}
         */
        EnduranceGroupAggregateLogChanged {
            get => (this._bitfield >> 14) & 0x1
            set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
        }

        /**
         * @type {Integer}
         */
        NormalNvmSubsystemShutdown {
            get => (this._bitfield >> 15) & 0x1
            set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
        }

        /**
         * @type {Integer}
         */
        Reserved2 {
            get => (this._bitfield >> 16) & 0x7FF
            set => this._bitfield := ((value & 0x7FF) << 16) | (this._bitfield & ~(0x7FF << 16))
        }

        /**
         * @type {Integer}
         */
        ZoneInformation {
            get => (this._bitfield >> 27) & 0x1
            set => this._bitfield := ((value & 0x1) << 27) | (this._bitfield & ~(0x1 << 27))
        }

        /**
         * @type {Integer}
         */
        Reserved3 {
            get => (this._bitfield >> 28) & 0x7
            set => this._bitfield := ((value & 0x7) << 28) | (this._bitfield & ~(0x7 << 28))
        }

        /**
         * @type {Integer}
         */
        DiscoveryLogChanged {
            get => (this._bitfield >> 31) & 0x1
            set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
        }
    }

    struct _CTRATT {
        /**
         * This bitfield backs the following members:
         * - HostIdentifier128Bit
         * - NOPSPMode
         * - NVMSets
         * - ReadRecoveryLevels
         * - EnduranceGroups
         * - PredictableLatencyMode
         * - TBKAS
         * - NamespaceGranularity
         * - SQAssociations
         * - UUIDList
         * - MultiDomainSubsystem
         * - FixedCapacityManagement
         * - VariableCapacityManagement
         * - DeleteEnduranceGroup
         * - DeleteNVMSet
         * - ELBAS
         * - Reserved0
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        HostIdentifier128Bit {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        NOPSPMode {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        NVMSets {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        ReadRecoveryLevels {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        EnduranceGroups {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        PredictableLatencyMode {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }

        /**
         * @type {Integer}
         */
        TBKAS {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        NamespaceGranularity {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }

        /**
         * @type {Integer}
         */
        SQAssociations {
            get => (this._bitfield >> 8) & 0x1
            set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
        }

        /**
         * @type {Integer}
         */
        UUIDList {
            get => (this._bitfield >> 9) & 0x1
            set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
        }

        /**
         * @type {Integer}
         */
        MultiDomainSubsystem {
            get => (this._bitfield >> 10) & 0x1
            set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
        }

        /**
         * @type {Integer}
         */
        FixedCapacityManagement {
            get => (this._bitfield >> 11) & 0x1
            set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
        }

        /**
         * @type {Integer}
         */
        VariableCapacityManagement {
            get => (this._bitfield >> 12) & 0x1
            set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
        }

        /**
         * @type {Integer}
         */
        DeleteEnduranceGroup {
            get => (this._bitfield >> 13) & 0x1
            set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
        }

        /**
         * @type {Integer}
         */
        DeleteNVMSet {
            get => (this._bitfield >> 14) & 0x1
            set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
        }

        /**
         * @type {Integer}
         */
        ELBAS {
            get => (this._bitfield >> 15) & 0x1
            set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
        }

        /**
         * @type {Integer}
         */
        Reserved0 {
            get => (this._bitfield >> 16) & 0xFFFF
            set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
        }
    }

    struct _RRLS {
        /**
         * This bitfield backs the following members:
         * - ReadRecoveryLevel0
         * - ReadRecoveryLevel1
         * - ReadRecoveryLevel2
         * - ReadRecoveryLevel3
         * - ReadRecoveryLevel4
         * - ReadRecoveryLevel5
         * - ReadRecoveryLevel6
         * - ReadRecoveryLevel7
         * - ReadRecoveryLevel8
         * - ReadRecoveryLevel9
         * - ReadRecoveryLevel10
         * - ReadRecoveryLevel11
         * - ReadRecoveryLevel12
         * - ReadRecoveryLevel13
         * - ReadRecoveryLevel14
         * - ReadRecoveryLevel15
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        ReadRecoveryLevel0 {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        ReadRecoveryLevel1 {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        ReadRecoveryLevel2 {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        ReadRecoveryLevel3 {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        ReadRecoveryLevel4 {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        ReadRecoveryLevel5 {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }

        /**
         * @type {Integer}
         */
        ReadRecoveryLevel6 {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        ReadRecoveryLevel7 {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }

        /**
         * @type {Integer}
         */
        ReadRecoveryLevel8 {
            get => (this._bitfield >> 8) & 0x1
            set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
        }

        /**
         * @type {Integer}
         */
        ReadRecoveryLevel9 {
            get => (this._bitfield >> 9) & 0x1
            set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
        }

        /**
         * @type {Integer}
         */
        ReadRecoveryLevel10 {
            get => (this._bitfield >> 10) & 0x1
            set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
        }

        /**
         * @type {Integer}
         */
        ReadRecoveryLevel11 {
            get => (this._bitfield >> 11) & 0x1
            set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
        }

        /**
         * @type {Integer}
         */
        ReadRecoveryLevel12 {
            get => (this._bitfield >> 12) & 0x1
            set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
        }

        /**
         * @type {Integer}
         */
        ReadRecoveryLevel13 {
            get => (this._bitfield >> 13) & 0x1
            set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
        }

        /**
         * @type {Integer}
         */
        ReadRecoveryLevel14 {
            get => (this._bitfield >> 14) & 0x1
            set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
        }

        /**
         * @type {Integer}
         */
        ReadRecoveryLevel15 {
            get => (this._bitfield >> 15) & 0x1
            set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
        }
    }

    struct _OACS {
        /**
         * This bitfield backs the following members:
         * - SecurityCommands
         * - FormatNVM
         * - FirmwareCommands
         * - NamespaceCommands
         * - DeviceSelfTest
         * - Directives
         * - NVMeMICommands
         * - VirtualizationMgmt
         * - DoorBellBufferConfig
         * - GetLBAStatus
         * - CommandFeatureLockdown
         * - Reserved
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        SecurityCommands {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        FormatNVM {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        FirmwareCommands {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        NamespaceCommands {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        DeviceSelfTest {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        Directives {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }

        /**
         * @type {Integer}
         */
        NVMeMICommands {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        VirtualizationMgmt {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }

        /**
         * @type {Integer}
         */
        DoorBellBufferConfig {
            get => (this._bitfield >> 8) & 0x1
            set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
        }

        /**
         * @type {Integer}
         */
        GetLBAStatus {
            get => (this._bitfield >> 9) & 0x1
            set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
        }

        /**
         * @type {Integer}
         */
        CommandFeatureLockdown {
            get => (this._bitfield >> 10) & 0x1
            set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
        }
    }

    struct _FRMW {
        /**
         * This bitfield backs the following members:
         * - Slot1ReadOnly
         * - SlotCount
         * - ActivationWithoutReset
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        Slot1ReadOnly {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        SlotCount {
            get => (this._bitfield >> 1) & 0x7
            set => this._bitfield := ((value & 0x7) << 1) | (this._bitfield & ~(0x7 << 1))
        }

        /**
         * @type {Integer}
         */
        ActivationWithoutReset {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    }

    struct _LPA {
        /**
         * This bitfield backs the following members:
         * - SmartPagePerNamespace
         * - CommandEffectsLog
         * - LogPageExtendedData
         * - TelemetrySupport
         * - PersistentEventLog
         * - SupportedLogPages
         * - TelemetryDataArea4
         * - Reserved1
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        SmartPagePerNamespace {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        CommandEffectsLog {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        LogPageExtendedData {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        TelemetrySupport {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        PersistentEventLog {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        SupportedLogPages {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }

        /**
         * @type {Integer}
         */
        TelemetryDataArea4 {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        Reserved1 {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    }

    struct _AVSCC {
        /**
         * This bitfield backs the following members:
         * - CommandFormatInSpec
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        CommandFormatInSpec {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    struct _APSTA {
        /**
         * This bitfield backs the following members:
         * - Supported
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        Supported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    struct _RPMBS {
        /**
         * This bitfield backs the following members:
         * - RPMBUnitCount
         * - AuthenticationMethod
         * - Reserved0
         * - TotalSize
         * - AccessSize
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        RPMBUnitCount {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }

        /**
         * @type {Integer}
         */
        AuthenticationMethod {
            get => (this._bitfield >> 3) & 0x7
            set => this._bitfield := ((value & 0x7) << 3) | (this._bitfield & ~(0x7 << 3))
        }

        /**
         * @type {Integer}
         */
        Reserved0 {
            get => (this._bitfield >> 6) & 0x3FF
            set => this._bitfield := ((value & 0x3FF) << 6) | (this._bitfield & ~(0x3FF << 6))
        }

        /**
         * @type {Integer}
         */
        TotalSize {
            get => (this._bitfield >> 16) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 16) | (this._bitfield & ~(0xFF << 16))
        }

        /**
         * @type {Integer}
         */
        AccessSize {
            get => (this._bitfield >> 24) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
        }
    }

    struct _HCTMA {
        /**
         * This bitfield backs the following members:
         * - Supported
         * - Reserved
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        Supported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    struct _SANICAP {
        /**
         * This bitfield backs the following members:
         * - CryptoErase
         * - BlockErase
         * - Overwrite
         * - Reserved
         * - NDI
         * - NODMMAS
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        CryptoErase {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        BlockErase {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        Overwrite {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        NDI {
            get => (this._bitfield >> 29) & 0x1
            set => this._bitfield := ((value & 0x1) << 29) | (this._bitfield & ~(0x1 << 29))
        }

        /**
         * @type {Integer}
         */
        NODMMAS {
            get => (this._bitfield >> 30) & 0x3
            set => this._bitfield := ((value & 0x3) << 30) | (this._bitfield & ~(0x3 << 30))
        }
    }

    struct _ANACAP {
        /**
         * This bitfield backs the following members:
         * - OptimizedState
         * - NonOptimizedState
         * - InaccessibleState
         * - PersistentLossState
         * - ChangeState
         * - Reserved
         * - StaticANAGRPID
         * - SupportNonZeroANAGRPID
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        OptimizedState {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        NonOptimizedState {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        InaccessibleState {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        PersistentLossState {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        ChangeState {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        StaticANAGRPID {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        SupportNonZeroANAGRPID {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    }

    struct _SQES {
        /**
         * This bitfield backs the following members:
         * - RequiredEntrySize
         * - MaxEntrySize
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        RequiredEntrySize {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }

        /**
         * @type {Integer}
         */
        MaxEntrySize {
            get => (this._bitfield >> 4) & 0xF
            set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
        }
    }

    struct _CQES {
        /**
         * This bitfield backs the following members:
         * - RequiredEntrySize
         * - MaxEntrySize
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        RequiredEntrySize {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }

        /**
         * @type {Integer}
         */
        MaxEntrySize {
            get => (this._bitfield >> 4) & 0xF
            set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
        }
    }

    struct _ONCS {
        /**
         * This bitfield backs the following members:
         * - Compare
         * - WriteUncorrectable
         * - DatasetManagement
         * - WriteZeroes
         * - FeatureField
         * - Reservations
         * - Timestamp
         * - Verify
         * - Reserved
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        Compare {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        WriteUncorrectable {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        DatasetManagement {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        WriteZeroes {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        FeatureField {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        Reservations {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }

        /**
         * @type {Integer}
         */
        Timestamp {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        Verify {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    }

    struct _FUSES {
        /**
         * This bitfield backs the following members:
         * - CompareAndWrite
         * - Reserved
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        CompareAndWrite {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    struct _FNA {
        /**
         * This bitfield backs the following members:
         * - FormatApplyToAll
         * - SecureEraseApplyToAll
         * - CryptographicEraseSupported
         * - FormatSupportNSIDAllF
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        FormatApplyToAll {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        SecureEraseApplyToAll {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        CryptographicEraseSupported {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        FormatSupportNSIDAllF {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    }

    struct _VWC {
        /**
         * This bitfield backs the following members:
         * - Present
         * - FlushBehavior
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        Present {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        FlushBehavior {
            get => (this._bitfield >> 1) & 0x3
            set => this._bitfield := ((value & 0x3) << 1) | (this._bitfield & ~(0x3 << 1))
        }
    }

    struct _NVSCC {
        /**
         * This bitfield backs the following members:
         * - CommandFormatInSpec
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        CommandFormatInSpec {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    struct _NWPC {
        /**
         * This bitfield backs the following members:
         * - WriteProtect
         * - UntilPowerCycle
         * - Permanent
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        WriteProtect {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        UntilPowerCycle {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        Permanent {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    }

    struct _SGLS {
        /**
         * This bitfield backs the following members:
         * - SGLSupported
         * - KeyedSGLData
         * - Reserved0
         * - BitBucketDescrSupported
         * - ByteAlignedContiguousPhysicalBuffer
         * - SGLLengthLargerThanDataLength
         * - MPTRSGLDescriptor
         * - AddressFieldSGLDataBlock
         * - TransportSGLData
         * - Reserved1
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        SGLSupported {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }

        /**
         * @type {Integer}
         */
        KeyedSGLData {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        Reserved0 {
            get => (this._bitfield >> 3) & 0x1FFF
            set => this._bitfield := ((value & 0x1FFF) << 3) | (this._bitfield & ~(0x1FFF << 3))
        }

        /**
         * @type {Integer}
         */
        BitBucketDescrSupported {
            get => (this._bitfield >> 16) & 0x1
            set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
        }

        /**
         * @type {Integer}
         */
        ByteAlignedContiguousPhysicalBuffer {
            get => (this._bitfield >> 17) & 0x1
            set => this._bitfield := ((value & 0x1) << 17) | (this._bitfield & ~(0x1 << 17))
        }

        /**
         * @type {Integer}
         */
        SGLLengthLargerThanDataLength {
            get => (this._bitfield >> 18) & 0x1
            set => this._bitfield := ((value & 0x1) << 18) | (this._bitfield & ~(0x1 << 18))
        }

        /**
         * @type {Integer}
         */
        MPTRSGLDescriptor {
            get => (this._bitfield >> 19) & 0x1
            set => this._bitfield := ((value & 0x1) << 19) | (this._bitfield & ~(0x1 << 19))
        }

        /**
         * @type {Integer}
         */
        AddressFieldSGLDataBlock {
            get => (this._bitfield >> 20) & 0x1
            set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
        }

        /**
         * @type {Integer}
         */
        TransportSGLData {
            get => (this._bitfield >> 21) & 0x1
            set => this._bitfield := ((value & 0x1) << 21) | (this._bitfield & ~(0x1 << 21))
        }

        /**
         * @type {Integer}
         */
        Reserved1 {
            get => (this._bitfield >> 22) & 0x3FF
            set => this._bitfield := ((value & 0x3FF) << 22) | (this._bitfield & ~(0x3FF << 22))
        }
    }

    struct _FCATT {
        /**
         * This bitfield backs the following members:
         * - StaticControllerModel
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        StaticControllerModel {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    struct _OFCS {
        /**
         * This bitfield backs the following members:
         * - IOQueueDeletion
         * - Reserved
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        IOQueueDeletion {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    /**
     * Contains the company vendor identifier that is assigned by the [Peripheral Component Interconnect - Special Interest Group (PCI-SIG)](https://pcisig.com/).
     */
    VID : UInt16

    /**
     * Contains the company vendor identifier that is assigned by the PCI-SIG for the subsystem.
     */
    SSVID : UInt16

    /**
     * Contains the serial number for the NVM subsystem that is assigned by the vendor as an ASCII string.
     */
    SN : Int8[20]

    /**
     * Contains the model number for the NVM subsystem that is assigned by the vendor as an ASCII string.
     */
    MN : Int8[40]

    /**
     * Contains the currently active firmware revision for the NVM subsystem.
     * 
     * This is the same firmware revision information in the [NVME_FIRMWARE_SLOT_INFO_LOG](ns-nvme-nvme_firmware_slot_info_log.md) that can be retrieved with the Get Log Page command.
     */
    FR : Int8[8]

    /**
     * Contains the recommended Arbitration Burst size.
     */
    RAB : Int8

    /**
     * Contains the Organization Unique Identifier (OUI) for the controller vendor.
     * 
     * The OUI is a valid IEEE/RAC assigned identifier that can be registered at http://standards.ieee.org/develop/regauth/oui/public.html.
     */
    IEEE : Int8[3]

    /**
     * A Controller Multi-Path I/O and Namespace Sharing Capabilities (CMIC) structure that specifies the multi-path I/O and namespace sharing capabilities of the controller and NVM subsystem.
     */
    CMIC : NVME_IDENTIFY_CONTROLLER_DATA._CMIC

    /**
     * Indicates the maximum data transfer size between the host and the controller.
     * 
     * The host should not submit a command that exceeds this transfer size. If a command is submitted that exceeds the transfer size, the command is aborted with a status of [NVME_STATUS_INVALID_FIELD_IN_COMMAND](ne-nvme-nvme_status_generic_command_codes.md#field-nvme-status-invalid-field-in-command).
     * 
     * The value of this field is in units of the minimum memory page size specified in the **MPSMIN** field of the [Controller Capabilities](ns-nvme-nvme_controller_capabilities.md) structure, and is reported as a power of two (2^n). A value of `0h` indicates no restrictions on transfer size. The restriction includes metadata if it is interleaved with the logical block data.
     * 
     * If SGL Bit Bucket descriptors are supported, their lengths are included in determining if a command exceeds the Maximum Data Transfer Size for destination data buffers. Their length in a source data buffer is not included for a Maximum Data Transfer Size calculation.
     */
    MDTS : Int8

    /**
     * Contains the NVM subsystem unique controller identifier associated with the controller.
     */
    CNTLID : UInt16

    /**
     * Contains the value reported in the Version register, defined in the **VS** field of the [NVME_CONTROLLER_REGISTERS](../nvme/ns-nvme-nvme_controller_registers.md) structure.
     * 
     * Implementations that are compliant with NVMe specification version 1.2 or later, will report a non-zero value in this field.
     */
    VER : UInt32

    /**
     * Indicates the typical latency in microseconds when resuming from Runtime D3 (RTD3).
     * 
     * Implementations that are compliant with NVMe specification version 1.2 or later, will report a non-zero value in this field.
     */
    RTD3R : UInt32

    /**
     * Indicates the typical latency in microseconds to enter Runtime D3 (RTD3).
     * 
     * Implementations that are compliant with NVMe specification version 1.2 or later, will report a non-zero value in this field.
     */
    RTD3E : UInt32

    /**
     * An Optional Asynchronous Events Supported (OAES) structure containing fields that indicate whether optional asynchronous events are supported by the controller.
     * 
     * A controller should not send optional asynchronous events before they are enabled by host software.
     */
    OAES : NVME_IDENTIFY_CONTROLLER_DATA._OAES

    /**
     * A Controller Attributes (CTRATT) structure containing controller attribute information.
     */
    CTRATT : NVME_IDENTIFY_CONTROLLER_DATA._CTRATT

    RRLS : NVME_IDENTIFY_CONTROLLER_DATA._RRLS

    /**
     * Bits 10:31 of the **OAES** structure are reserved.
     */
    Reserved0 : Int8[9]

    CNTRLTYPE : Int8

    FGUID : Int8[16]

    CRDT1 : UInt16

    CRDT2 : UInt16

    CRDT3 : UInt16

    /**
     * Bits 0:7 of the **OAES** structure are reserved.
     */
    Reserved1 : Int8[106]

    /**
     * Reserved for NVMe Management.
     */
    ReservedForManagement : Int8[13]

    NVMSR : Int8

    VWCI : Int8

    MEC : Int8

    /**
     * An Optional Admin Command Support (OACS) structure containing fields that indicate the optional [Admin Commands](ne-nvme-nvme_admin_commands.md) supported by the controller.
     */
    OACS : NVME_IDENTIFY_CONTROLLER_DATA._OACS

    /**
     * Indicates the maximum number of concurrently outstanding [Abort](ns-nvme-nvme_cdw10_abort.md) commands supported by the controller.
     * 
     * This is a 0’s based value. Implementations should support a minimum of four outstanding Abort commands simultaneously.
     */
    ACL : Int8

    /**
     * Indicates the maximum number of concurrently outstanding [Asynchronous Event Request](ne-nvme-nvme_async_event_types.md) commands supported by the controller.
     * 
     * This is a 0’s based value. Implementations should support a minimum of four outstanding Asynchronous Event Request commands simultaneously.
     */
    AERL : Int8

    /**
     * A Firmware Updates (FRMW) structure containing fields that indicate capabilities regarding firmware updates.
     */
    FRMW : NVME_IDENTIFY_CONTROLLER_DATA._FRMW

    /**
     * A Log Page Attributes (LPA) structure containing fields that indicate optional attributes for log pages that are accessed by using the [Get Log Page](ns-nvme-nvme_cdw10_get_log_page.md) command.
     */
    LPA : NVME_IDENTIFY_CONTROLLER_DATA._LPA

    /**
     * Indicates the number of Error Information log entries that are stored by the controller. This field is a 0’s based value.
     */
    ELPE : Int8

    /**
     * Indicates the number of NVM Express power states supported by the controller. This is a 0’s based value.
     * 
     * Power states are numbered sequentially starting at power state 0. A controller must support at least one power state (for example, power state 0), and may support up to 31 additional power states, for a total of 32.
     */
    NPSS : Int8

    /**
     * An Admin Vendor Specific Command Configuration (AVSCC) structure containing fields that indicate the configuration settings for Admin Vendor Specific command handling.
     */
    AVSCC : NVME_IDENTIFY_CONTROLLER_DATA._AVSCC

    /**
     * An Autonomous Power State Transition Attributes (APSTA) structure containing fields that indicate the attributes of the [autonomous power state transition feature](ns-nvme-nvme_cdw11_feature_auto_power_state_transition.md).
     */
    APSTA : NVME_IDENTIFY_CONTROLLER_DATA._APSTA

    /**
     * Indicates the minimum Composite Temperature field value (reported in the [SMART / Health Information](ns-nvme-nvme_health_info_log.md) log that indicates an overheating condition during which controller operation continues.
     * 
     * Immediate remediation is recommended (for example, additional cooling or workload reduction). The platform should strive to maintain a composite temperature below this value.
     * 
     * A value of `0h` in this field indicates that no warning temperature threshold value is reported by the controller. Implementations compliant to NVMe Spec version 1.2 or later should report a non-zero value in this field. It is recommended that implementations report a value of `0157h` in this field.
     */
    WCTEMP : UInt16

    /**
     * Indicates the minimum Composite Temperature field value (reported in the [SMART / Health Information](ns-nvme-nvme_health_info_log.md log) that indicates a critical overheating condition. For example, a condition that may prevent continued normal operation, possibility of data loss, automatic device shutdown, extreme performance throttling, or permanent damage.
     * 
     * A value of `0h` in this field indicates that no critical temperature threshold value is reported by the controller. Implementations compliant to NVMe Spec version 1.2 or later should report a non-zero value in this field.
     */
    CCTEMP : UInt16

    /**
     * Indicates the maximum time the controller temporarily stops processing commands to activate the firmware image.
     * 
     * This field is valid if the controller supports firmware activation without a reset. The **MFTA** value is specified in 100 millisecond units. A value of `0h` indicates that the maximum time is undefined.
     */
    MTFA : UInt16

    /**
     * Indicates the preferred size that the host should allocate for the [Host Memory Buffer](ns-nvme-nvme_cdw11_feature_host_memory_buffer.md) feature in 4KB units.
     * 
     * This value must be larger than or equal to the Host Memory Buffer Minimum Size (**HMMIN**).
     * 
     * If this field is non-zero, then the Host Memory Buffer feature is supported. When this value is cleared to `0h`, the Host Memory Buffer feature is not supported.
     */
    HMPRE : UInt32

    /**
     * Indicates the minimum size that the host should allocate for the Host Memory Buffer feature in 4KB units. 
     * 
     * When this value is cleared to `0`, the host is requested to allocate any amount of host memory possible up to the **HMPRE** value.
     */
    HMMIN : UInt32

    /**
     * Indicates the total NVM capacity, in bytes, of the NVM subsystem.
     * 
     * This field is supported if the Namespace Management and Namespace Attachment commands are supported.
     */
    TNVMCAP : Int8[16]

    /**
     * Indicates the unallocated NVM capacity, in bytes, of the NVM subsystem. 
     * 
     * This field is supported if the Namespace Management and Namespace Attachment commands are supported.
     */
    UNVMCAP : Int8[16]

    /**
     * A Replay Protected Memory Block Support (RPMBS) structure containing fields that indicate whether the controller supports one or more Replay Protected Memory Blocks (RPMBs) and the associated capabilities.
     */
    RPMBS : NVME_IDENTIFY_CONTROLLER_DATA._RPMBS

    /**
     * Indicates the Extended Device Self-test Time (EDSTT).
     */
    EDSTT : UInt16

    /**
     * Indicates the Device Self-test Options (DSTO).
     */
    DSTO : Int8

    /**
     * Indicates the Firmware Update Granularity (FWUG).
     */
    FWUG : Int8

    /**
     * Indicates the Keep Alive Support (KAS).
     */
    KAS : UInt16

    /**
     * A Host Controlled Thermal Management Attributes (HCTMA) structure.
     */
    HCTMA : NVME_IDENTIFY_CONTROLLER_DATA._HCTMA

    /**
     * Minimum Thermal Management Temperature (MNTMT)
     */
    MNTMT : UInt16

    /**
     * Maximum Thermal Management Temperature (MXTMT)
     */
    MXTMT : UInt16

    /**
     * Sanitize Capabilities (SANICAP)
     */
    SANICAP : NVME_IDENTIFY_CONTROLLER_DATA._SANICAP

    HMMINDS : UInt32

    HMMAXD : UInt16

    /**
     * NVM Set Identifier Maximum
     */
    NSETIDMAX : UInt16

    ENDGIDMAX : UInt16

    ANATT : Int8

    ANACAP : NVME_IDENTIFY_CONTROLLER_DATA._ANACAP

    ANAGRPMAX : UInt32

    NANAGRPID : UInt32

    PELS : UInt32

    DomainId : UInt16

    Reserved2 : Int8[10]

    MEGCAP : Int8[16]

    TMPTHHA : Int8

    /**
     * A reserved field.
     */
    Reserved3 : Int8

    CQT : UInt16

    /**
     * A reserved field.
     */
    Reserved4 : Int8[124]

    /**
     * A Submission Queue Entry Size (SQES) structure containing fields that indicate the required and maximum Submission Queue entry size when using the NVM Command Set.
     */
    SQES : NVME_IDENTIFY_CONTROLLER_DATA._SQES

    /**
     * A Completion Queue Entry Size (CQES) structure containing fields that indicate the required and maximum Completion Queue entry size when using the NVM Command Set.
     */
    CQES : NVME_IDENTIFY_CONTROLLER_DATA._CQES

    MAXCMD : UInt16

    /**
     * Indicates the number of valid namespaces present for the controller.
     */
    NN : UInt32

    /**
     * An Optional NVM Command Support (ONCS) structure containing fields that indicate the optional [NVM commands](ne-nvme-nvme_nvm_commands.md) and features supported by the controller.
     */
    ONCS : NVME_IDENTIFY_CONTROLLER_DATA._ONCS

    /**
     * A Fused Operation Support (FUSES) structure containing fields that indicate the fused operations that the controller supports.
     */
    FUSES : NVME_IDENTIFY_CONTROLLER_DATA._FUSES

    /**
     * A Format NVM Attributes (FNA) structure containing fields that indicate attributes for the [Format NVM](ns-nvme-nvme_cdw10_format_nvm.md) command.
     */
    FNA : NVME_IDENTIFY_CONTROLLER_DATA._FNA

    /**
     * A Volatile Write Cache (VWC) structure containing fields that indicate attributes related to the presence of a volatile write cache in the implementation.
     */
    VWC : NVME_IDENTIFY_CONTROLLER_DATA._VWC

    /**
     * Indicates the size of the write operation guaranteed to be written atomically to the NVM across all namespaces with any supported namespace format during normal operation.  This field is specified in logical blocks and is a 0’s based value.
     * 
     * If a specific namespace guarantees a larger size than is reported in this field, then this namespace specific size is reported in the **NAWUN** field of the [Identify Namespace](../nvme/ns-nvme-nvme_identify_namespace_data.md) data structure.
     * 
     * If a write command is submitted with size less than or equal to the **AWUN** value, the host is guaranteed that the write command is atomic to the NVM with respect to other read or write commands. If a write command is submitted with size greater than the **AWUN** value, then there is no guarantee of command atomicity.
     * 
     * The **AWUN** value does not have any applicability to write errors caused by power failure. For more information, see the Atomic Write Unit Power Fail (**AWUPF**) field.
     * 
     * A value of `FFFFh` indicates all commands are atomic as this is the largest command size. Implementations should support a minimum of 128KB, appropriately scaled based on the Logical Block Access (LBA) size.
     */
    AWUN : UInt16

    /**
     * Indicates the size of the write operation guaranteed to be written atomically to the NVM across all namespaces with any supported namespace format during a power fail or error condition. This field is specified in logical blocks and is a 0’s based value. 
     * 
     * If a specific namespace guarantees a larger size than is reported in this field, then this namespace specific size is reported in the **NAWUPF** field in the [Identify Namespace](../nvme/ns-nvme-nvme_identify_namespace_data.md) data structure. The **AWUPF** value must be less than or equal to the **AWUN** value.
     * 
     * If a write command is submitted with size less than or equal to the **AWUPF** value, the host is guaranteed that the write is atomic to the NVM with respect to other read or write commands. If a write command is submitted that is greater than this size, there is no guarantee of command atomicity. If the write size is less than or equal to the **AWUPF** value and the write command fails, then subsequent read commands for the associated logical blocks will return data from the previous successful write command.
     * 
     * If a write command is submitted with size greater than the **AWUPF** value, then there is no guarantee of data returned on subsequent reads of the associated logical blocks.
     */
    AWUPF : UInt16

    /**
     * A NVM Vendor Specific Command Configuration (NVSCC) structure containing fields that indicate the configuration settings for NVM Vendor Specific command handling.
     */
    NVSCC : NVME_IDENTIFY_CONTROLLER_DATA._NVSCC

    NWPC : NVME_IDENTIFY_CONTROLLER_DATA._NWPC

    /**
     * Indicates the size of the write operation guaranteed to be written atomically to the NVM across all namespaces with any supported namespace format for a Compare and Write fused operation.
     * 
     * If a specific namespace guarantees a larger size than is reported in this field, then this namespace specific size is reported in the **NACWU** field in the [Identify Namespace](../nvme/ns-nvme-nvme_identify_namespace_data.md) data structure.
     * 
     * This field will be supported if the Compare and Write fused command is supported. This field is specified in logical blocks and is a 0’s based value. If a Compare and Write is submitted that requests a transfer size larger than this value, the controller may fail the command with a status of [NVME_STATUS_INVALID_FIELD_IN_COMMAND](ne-nvme-nvme_status_generic_command_codes.md).
     * 
     * If Compare and Write is not a supported fused command, the value of this field will be `0h`.
     */
    ACWU : UInt16

    CopyDescFormats : UInt16

    /**
     * A SGL Support (SGLS) structure containing fields that specify whether Scatter Gather Lists (SGL) are supported for the NVM Command Set and the supported SGL types.
     */
    SGLS : NVME_IDENTIFY_CONTROLLER_DATA._SGLS

    MNAN : UInt32

    MAXDNA : Int8[16]

    MAXCNA : UInt32

    /**
     * Bytes 704:2047 are reserved for I/O Command Set Attributes.
     */
    Reserved6 : Int8[204]

    SUBNQN : Int8[256]

    Reserved7 : Int8[768]

    IOCCSZ : UInt32

    IORCSZ : UInt32

    ICDOFF : UInt16

    FCATT : NVME_IDENTIFY_CONTROLLER_DATA._FCATT

    MSDBD : Int8

    OFCS : NVME_IDENTIFY_CONTROLLER_DATA._OFCS

    DCTYPE : Int8

    Reserved8 : Int8[241]

    /**
     * Contains an array of 32 Power State Descriptors. Each member of the array is a 32 bit field that indicates the characteristics of a Power State Descriptor. The format of this field is defined in the [NVME_POWER_STATE_DESC](ns-nvme-nvme_power_state_desc.md) structure.
     * 
     * The zero-based position of a structure in the array corresponds to the name of the Power State Descriptor, such that Power State 0 Descriptor (PSD0) is in position 0, Power State 1 Descriptor (PSD1) is in position 1, and so on, up to Power State 31 Descriptor (PSD31) in position 31.
     */
    PDS : NVME_POWER_STATE_DESC[32]

    /**
     * Bytes 3072:4095 are allocated for vendor specific usage.
     */
    VS : Int8[1024]

}
