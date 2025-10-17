#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_POWER_STATE_DESC.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_IDENTIFY_CONTROLLER_DATA extends Win32Struct
{
    static sizeof => 3328

    static packingSize => 8

    class _CMIC extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - MultiPCIePorts
         * - MultiControllers
         * - SRIOV
         * - ANAR
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        MultiPCIePorts {
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
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 4) & 0xF
            set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
        }
    
    }

    class _OAES extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

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
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
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

    class _CTRATT extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

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
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
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

    class _RRLS extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

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
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
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

    class _OACS extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

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
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
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
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 11) & 0x1F
            set => this._bitfield := ((value & 0x1F) << 11) | (this._bitfield & ~(0x1F << 11))
        }
    
    }

    class _FRMW extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - Slot1ReadOnly
         * - SlotCount
         * - ActivationWithoutReset
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
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
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 5) & 0x7
            set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
        }
    
    }

    class _LPA extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

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
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
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

    class _AVSCC extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - CommandFormatInSpec
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        CommandFormatInSpec {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 1) & 0x7F
            set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
        }
    
    }

    class _APSTA extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - Supported
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
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
        Reserved {
            get => (this._bitfield >> 1) & 0x7F
            set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
        }
    
    }

    class _RPMBS extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - RPMBUnitCount
         * - AuthenticationMethod
         * - Reserved0
         * - TotalSize
         * - AccessSize
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
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

    class _HCTMA extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - Supported
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
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
        Reserved {
            get => (this._bitfield >> 1) & 0x7FFF
            set => this._bitfield := ((value & 0x7FFF) << 1) | (this._bitfield & ~(0x7FFF << 1))
        }
    
    }

    class _SANICAP extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - CryptoErase
         * - BlockErase
         * - Overwrite
         * - Reserved
         * - NDI
         * - NODMMAS
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
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
        Reserved {
            get => (this._bitfield >> 3) & 0x3FFFFFF
            set => this._bitfield := ((value & 0x3FFFFFF) << 3) | (this._bitfield & ~(0x3FFFFFF << 3))
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

    class _ANACAP extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

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
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
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
        Reserved {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
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

    class _SQES extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - RequiredEntrySize
         * - MaxEntrySize
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
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

    class _CQES extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - RequiredEntrySize
         * - MaxEntrySize
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
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

    class _ONCS extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

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
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
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
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 8) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
        }
    
    }

    class _FUSES extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - CompareAndWrite
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        CompareAndWrite {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 1) & 0x7FFF
            set => this._bitfield := ((value & 0x7FFF) << 1) | (this._bitfield & ~(0x7FFF << 1))
        }
    
    }

    class _FNA extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - FormatApplyToAll
         * - SecureEraseApplyToAll
         * - CryptographicEraseSupported
         * - FormatSupportNSIDAllF
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
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
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 4) & 0xF
            set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
        }
    
    }

    class _VWC extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - Present
         * - FlushBehavior
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
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
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 3) & 0x1F
            set => this._bitfield := ((value & 0x1F) << 3) | (this._bitfield & ~(0x1F << 3))
        }
    
    }

    class _NVSCC extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - CommandFormatInSpec
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        CommandFormatInSpec {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 1) & 0x7F
            set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
        }
    
    }

    class _NWPC extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - WriteProtect
         * - UntilPowerCycle
         * - Permanent
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
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
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 3) & 0x1F
            set => this._bitfield := ((value & 0x1F) << 3) | (this._bitfield & ~(0x1F << 3))
        }
    
    }

    class _SGLS extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

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
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
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

    class _FCATT extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - StaticControllerModel
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        StaticControllerModel {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 1) & 0x7F
            set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
        }
    
    }

    class _OFCS extends Win32Struct {
        static sizeof => 3328
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - IOQueueDeletion
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        IOQueueDeletion {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 1) & 0x7FFF
            set => this._bitfield := ((value & 0x7FFF) << 1) | (this._bitfield & ~(0x7FFF << 1))
        }
    
    }

    /**
     * @type {Integer}
     */
    VID {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SSVID {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    SN{
        get {
            if(!this.HasProp("__SNProxyArray"))
                this.__SNProxyArray := Win32FixedArray(this.ptr + 4, 20, Primitive, "char")
            return this.__SNProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    MN{
        get {
            if(!this.HasProp("__MNProxyArray"))
                this.__MNProxyArray := Win32FixedArray(this.ptr + 24, 40, Primitive, "char")
            return this.__MNProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    FR{
        get {
            if(!this.HasProp("__FRProxyArray"))
                this.__FRProxyArray := Win32FixedArray(this.ptr + 64, 8, Primitive, "char")
            return this.__FRProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    RAB {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }

    /**
     * @type {Array<Byte>}
     */
    IEEE{
        get {
            if(!this.HasProp("__IEEEProxyArray"))
                this.__IEEEProxyArray := Win32FixedArray(this.ptr + 73, 3, Primitive, "char")
            return this.__IEEEProxyArray
        }
    }

    /**
     * @type {_CMIC}
     */
    CMIC{
        get {
            if(!this.HasProp("__CMIC"))
                this.__CMIC := %this.__Class%._CMIC(76, this)
            return this.__CMIC
        }
    }

    /**
     * @type {Integer}
     */
    MDTS {
        get => NumGet(this, 77, "char")
        set => NumPut("char", value, this, 77)
    }

    /**
     * @type {Integer}
     */
    CNTLID {
        get => NumGet(this, 78, "ushort")
        set => NumPut("ushort", value, this, 78)
    }

    /**
     * @type {Integer}
     */
    VER {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    RTD3R {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    RTD3E {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {_OAES}
     */
    OAES{
        get {
            if(!this.HasProp("__OAES"))
                this.__OAES := %this.__Class%._OAES(92, this)
            return this.__OAES
        }
    }

    /**
     * @type {_CTRATT}
     */
    CTRATT{
        get {
            if(!this.HasProp("__CTRATT"))
                this.__CTRATT := %this.__Class%._CTRATT(96, this)
            return this.__CTRATT
        }
    }

    /**
     * @type {_RRLS}
     */
    RRLS{
        get {
            if(!this.HasProp("__RRLS"))
                this.__RRLS := %this.__Class%._RRLS(100, this)
            return this.__RRLS
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 102, 9, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CNTRLTYPE {
        get => NumGet(this, 111, "char")
        set => NumPut("char", value, this, 111)
    }

    /**
     * @type {Array<Byte>}
     */
    FGUID{
        get {
            if(!this.HasProp("__FGUIDProxyArray"))
                this.__FGUIDProxyArray := Win32FixedArray(this.ptr + 112, 16, Primitive, "char")
            return this.__FGUIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CRDT1 {
        get => NumGet(this, 128, "ushort")
        set => NumPut("ushort", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    CRDT2 {
        get => NumGet(this, 130, "ushort")
        set => NumPut("ushort", value, this, 130)
    }

    /**
     * @type {Integer}
     */
    CRDT3 {
        get => NumGet(this, 132, "ushort")
        set => NumPut("ushort", value, this, 132)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 134, 106, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ReservedForManagement{
        get {
            if(!this.HasProp("__ReservedForManagementProxyArray"))
                this.__ReservedForManagementProxyArray := Win32FixedArray(this.ptr + 240, 13, Primitive, "char")
            return this.__ReservedForManagementProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    NVMSR {
        get => NumGet(this, 253, "char")
        set => NumPut("char", value, this, 253)
    }

    /**
     * @type {Integer}
     */
    VWCI {
        get => NumGet(this, 254, "char")
        set => NumPut("char", value, this, 254)
    }

    /**
     * @type {Integer}
     */
    MEC {
        get => NumGet(this, 255, "char")
        set => NumPut("char", value, this, 255)
    }

    /**
     * @type {_OACS}
     */
    OACS{
        get {
            if(!this.HasProp("__OACS"))
                this.__OACS := %this.__Class%._OACS(256, this)
            return this.__OACS
        }
    }

    /**
     * @type {Integer}
     */
    ACL {
        get => NumGet(this, 258, "char")
        set => NumPut("char", value, this, 258)
    }

    /**
     * @type {Integer}
     */
    AERL {
        get => NumGet(this, 259, "char")
        set => NumPut("char", value, this, 259)
    }

    /**
     * @type {_FRMW}
     */
    FRMW{
        get {
            if(!this.HasProp("__FRMW"))
                this.__FRMW := %this.__Class%._FRMW(260, this)
            return this.__FRMW
        }
    }

    /**
     * @type {_LPA}
     */
    LPA{
        get {
            if(!this.HasProp("__LPA"))
                this.__LPA := %this.__Class%._LPA(261, this)
            return this.__LPA
        }
    }

    /**
     * @type {Integer}
     */
    ELPE {
        get => NumGet(this, 262, "char")
        set => NumPut("char", value, this, 262)
    }

    /**
     * @type {Integer}
     */
    NPSS {
        get => NumGet(this, 263, "char")
        set => NumPut("char", value, this, 263)
    }

    /**
     * @type {_AVSCC}
     */
    AVSCC{
        get {
            if(!this.HasProp("__AVSCC"))
                this.__AVSCC := %this.__Class%._AVSCC(264, this)
            return this.__AVSCC
        }
    }

    /**
     * @type {_APSTA}
     */
    APSTA{
        get {
            if(!this.HasProp("__APSTA"))
                this.__APSTA := %this.__Class%._APSTA(265, this)
            return this.__APSTA
        }
    }

    /**
     * @type {Integer}
     */
    WCTEMP {
        get => NumGet(this, 266, "ushort")
        set => NumPut("ushort", value, this, 266)
    }

    /**
     * @type {Integer}
     */
    CCTEMP {
        get => NumGet(this, 268, "ushort")
        set => NumPut("ushort", value, this, 268)
    }

    /**
     * @type {Integer}
     */
    MTFA {
        get => NumGet(this, 270, "ushort")
        set => NumPut("ushort", value, this, 270)
    }

    /**
     * @type {Integer}
     */
    HMPRE {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    HMMIN {
        get => NumGet(this, 276, "uint")
        set => NumPut("uint", value, this, 276)
    }

    /**
     * @type {Array<Byte>}
     */
    TNVMCAP{
        get {
            if(!this.HasProp("__TNVMCAPProxyArray"))
                this.__TNVMCAPProxyArray := Win32FixedArray(this.ptr + 280, 16, Primitive, "char")
            return this.__TNVMCAPProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    UNVMCAP{
        get {
            if(!this.HasProp("__UNVMCAPProxyArray"))
                this.__UNVMCAPProxyArray := Win32FixedArray(this.ptr + 296, 16, Primitive, "char")
            return this.__UNVMCAPProxyArray
        }
    }

    /**
     * @type {_RPMBS}
     */
    RPMBS{
        get {
            if(!this.HasProp("__RPMBS"))
                this.__RPMBS := %this.__Class%._RPMBS(312, this)
            return this.__RPMBS
        }
    }

    /**
     * @type {Integer}
     */
    EDSTT {
        get => NumGet(this, 316, "ushort")
        set => NumPut("ushort", value, this, 316)
    }

    /**
     * @type {Integer}
     */
    DSTO {
        get => NumGet(this, 318, "char")
        set => NumPut("char", value, this, 318)
    }

    /**
     * @type {Integer}
     */
    FWUG {
        get => NumGet(this, 319, "char")
        set => NumPut("char", value, this, 319)
    }

    /**
     * @type {Integer}
     */
    KAS {
        get => NumGet(this, 320, "ushort")
        set => NumPut("ushort", value, this, 320)
    }

    /**
     * @type {_HCTMA}
     */
    HCTMA{
        get {
            if(!this.HasProp("__HCTMA"))
                this.__HCTMA := %this.__Class%._HCTMA(322, this)
            return this.__HCTMA
        }
    }

    /**
     * @type {Integer}
     */
    MNTMT {
        get => NumGet(this, 324, "ushort")
        set => NumPut("ushort", value, this, 324)
    }

    /**
     * @type {Integer}
     */
    MXTMT {
        get => NumGet(this, 326, "ushort")
        set => NumPut("ushort", value, this, 326)
    }

    /**
     * @type {_SANICAP}
     */
    SANICAP{
        get {
            if(!this.HasProp("__SANICAP"))
                this.__SANICAP := %this.__Class%._SANICAP(328, this)
            return this.__SANICAP
        }
    }

    /**
     * @type {Integer}
     */
    HMMINDS {
        get => NumGet(this, 332, "uint")
        set => NumPut("uint", value, this, 332)
    }

    /**
     * @type {Integer}
     */
    HMMAXD {
        get => NumGet(this, 336, "ushort")
        set => NumPut("ushort", value, this, 336)
    }

    /**
     * @type {Integer}
     */
    NSETIDMAX {
        get => NumGet(this, 338, "ushort")
        set => NumPut("ushort", value, this, 338)
    }

    /**
     * @type {Integer}
     */
    ENDGIDMAX {
        get => NumGet(this, 340, "ushort")
        set => NumPut("ushort", value, this, 340)
    }

    /**
     * @type {Integer}
     */
    ANATT {
        get => NumGet(this, 342, "char")
        set => NumPut("char", value, this, 342)
    }

    /**
     * @type {_ANACAP}
     */
    ANACAP{
        get {
            if(!this.HasProp("__ANACAP"))
                this.__ANACAP := %this.__Class%._ANACAP(343, this)
            return this.__ANACAP
        }
    }

    /**
     * @type {Integer}
     */
    ANAGRPMAX {
        get => NumGet(this, 344, "uint")
        set => NumPut("uint", value, this, 344)
    }

    /**
     * @type {Integer}
     */
    NANAGRPID {
        get => NumGet(this, 348, "uint")
        set => NumPut("uint", value, this, 348)
    }

    /**
     * @type {Integer}
     */
    PELS {
        get => NumGet(this, 352, "uint")
        set => NumPut("uint", value, this, 352)
    }

    /**
     * @type {Integer}
     */
    DomainId {
        get => NumGet(this, 356, "ushort")
        set => NumPut("ushort", value, this, 356)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 358, 10, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    MEGCAP{
        get {
            if(!this.HasProp("__MEGCAPProxyArray"))
                this.__MEGCAPProxyArray := Win32FixedArray(this.ptr + 368, 16, Primitive, "char")
            return this.__MEGCAPProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 384, 128, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }

    /**
     * @type {_SQES}
     */
    SQES{
        get {
            if(!this.HasProp("__SQES"))
                this.__SQES := %this.__Class%._SQES(512, this)
            return this.__SQES
        }
    }

    /**
     * @type {_CQES}
     */
    CQES{
        get {
            if(!this.HasProp("__CQES"))
                this.__CQES := %this.__Class%._CQES(513, this)
            return this.__CQES
        }
    }

    /**
     * @type {Integer}
     */
    MAXCMD {
        get => NumGet(this, 514, "ushort")
        set => NumPut("ushort", value, this, 514)
    }

    /**
     * @type {Integer}
     */
    NN {
        get => NumGet(this, 516, "uint")
        set => NumPut("uint", value, this, 516)
    }

    /**
     * @type {_ONCS}
     */
    ONCS{
        get {
            if(!this.HasProp("__ONCS"))
                this.__ONCS := %this.__Class%._ONCS(520, this)
            return this.__ONCS
        }
    }

    /**
     * @type {_FUSES}
     */
    FUSES{
        get {
            if(!this.HasProp("__FUSES"))
                this.__FUSES := %this.__Class%._FUSES(522, this)
            return this.__FUSES
        }
    }

    /**
     * @type {_FNA}
     */
    FNA{
        get {
            if(!this.HasProp("__FNA"))
                this.__FNA := %this.__Class%._FNA(524, this)
            return this.__FNA
        }
    }

    /**
     * @type {_VWC}
     */
    VWC{
        get {
            if(!this.HasProp("__VWC"))
                this.__VWC := %this.__Class%._VWC(525, this)
            return this.__VWC
        }
    }

    /**
     * @type {Integer}
     */
    AWUN {
        get => NumGet(this, 526, "ushort")
        set => NumPut("ushort", value, this, 526)
    }

    /**
     * @type {Integer}
     */
    AWUPF {
        get => NumGet(this, 528, "ushort")
        set => NumPut("ushort", value, this, 528)
    }

    /**
     * @type {_NVSCC}
     */
    NVSCC{
        get {
            if(!this.HasProp("__NVSCC"))
                this.__NVSCC := %this.__Class%._NVSCC(530, this)
            return this.__NVSCC
        }
    }

    /**
     * @type {_NWPC}
     */
    NWPC{
        get {
            if(!this.HasProp("__NWPC"))
                this.__NWPC := %this.__Class%._NWPC(531, this)
            return this.__NWPC
        }
    }

    /**
     * @type {Integer}
     */
    ACWU {
        get => NumGet(this, 532, "ushort")
        set => NumPut("ushort", value, this, 532)
    }

    /**
     * @type {Integer}
     */
    CopyDescFormats {
        get => NumGet(this, 534, "ushort")
        set => NumPut("ushort", value, this, 534)
    }

    /**
     * @type {_SGLS}
     */
    SGLS{
        get {
            if(!this.HasProp("__SGLS"))
                this.__SGLS := %this.__Class%._SGLS(536, this)
            return this.__SGLS
        }
    }

    /**
     * @type {Integer}
     */
    MNAN {
        get => NumGet(this, 540, "uint")
        set => NumPut("uint", value, this, 540)
    }

    /**
     * @type {Array<Byte>}
     */
    MAXDNA{
        get {
            if(!this.HasProp("__MAXDNAProxyArray"))
                this.__MAXDNAProxyArray := Win32FixedArray(this.ptr + 544, 16, Primitive, "char")
            return this.__MAXDNAProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    MAXCNA {
        get => NumGet(this, 560, "uint")
        set => NumPut("uint", value, this, 560)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved6{
        get {
            if(!this.HasProp("__Reserved6ProxyArray"))
                this.__Reserved6ProxyArray := Win32FixedArray(this.ptr + 564, 204, Primitive, "char")
            return this.__Reserved6ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    SUBNQN{
        get {
            if(!this.HasProp("__SUBNQNProxyArray"))
                this.__SUBNQNProxyArray := Win32FixedArray(this.ptr + 768, 256, Primitive, "char")
            return this.__SUBNQNProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved7{
        get {
            if(!this.HasProp("__Reserved7ProxyArray"))
                this.__Reserved7ProxyArray := Win32FixedArray(this.ptr + 1024, 768, Primitive, "char")
            return this.__Reserved7ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    IOCCSZ {
        get => NumGet(this, 1792, "uint")
        set => NumPut("uint", value, this, 1792)
    }

    /**
     * @type {Integer}
     */
    IORCSZ {
        get => NumGet(this, 1796, "uint")
        set => NumPut("uint", value, this, 1796)
    }

    /**
     * @type {Integer}
     */
    ICDOFF {
        get => NumGet(this, 1800, "ushort")
        set => NumPut("ushort", value, this, 1800)
    }

    /**
     * @type {_FCATT}
     */
    FCATT{
        get {
            if(!this.HasProp("__FCATT"))
                this.__FCATT := %this.__Class%._FCATT(1802, this)
            return this.__FCATT
        }
    }

    /**
     * @type {Integer}
     */
    MSDBD {
        get => NumGet(this, 1803, "char")
        set => NumPut("char", value, this, 1803)
    }

    /**
     * @type {_OFCS}
     */
    OFCS{
        get {
            if(!this.HasProp("__OFCS"))
                this.__OFCS := %this.__Class%._OFCS(1804, this)
            return this.__OFCS
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved8{
        get {
            if(!this.HasProp("__Reserved8ProxyArray"))
                this.__Reserved8ProxyArray := Win32FixedArray(this.ptr + 1806, 242, Primitive, "char")
            return this.__Reserved8ProxyArray
        }
    }

    /**
     * @type {Array<NVME_POWER_STATE_DESC>}
     */
    PDS{
        get {
            if(!this.HasProp("__PDSProxyArray"))
                this.__PDSProxyArray := Win32FixedArray(this.ptr + 2048, 32, NVME_POWER_STATE_DESC, "")
            return this.__PDSProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    VS{
        get {
            if(!this.HasProp("__VSProxyArray"))
                this.__VSProxyArray := Win32FixedArray(this.ptr + 2304, 1024, Primitive, "char")
            return this.__VSProxyArray
        }
    }
}
