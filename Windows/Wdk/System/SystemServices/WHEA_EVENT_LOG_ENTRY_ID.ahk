#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_EVENT_LOG_ENTRY_ID extends Win32Enum {

    /**
     * Native name: WheaEventLogEntryIdCmcPollingTimeout
     * @type {Integer (Int32)}
     */
    static CmcPollingTimeout => -2147483647

    /**
     * Native name: WheaEventLogEntryIdWheaInit
     * @type {Integer (Int32)}
     */
    static WheaInit => -2147483646

    /**
     * Native name: WheaEventLogEntryIdCmcSwitchToPolling
     * @type {Integer (Int32)}
     */
    static CmcSwitchToPolling => -2147483645

    /**
     * Native name: WheaEventLogEntryIdDroppedCorrectedError
     * @type {Integer (Int32)}
     */
    static DroppedCorrectedError => -2147483644

    /**
     * Native name: WheaEventLogEntryIdStartedReportHwError
     * @type {Integer (Int32)}
     */
    static StartedReportHwError => -2147483643

    /**
     * Native name: WheaEventLogEntryIdPFAMemoryOfflined
     * @type {Integer (Int32)}
     */
    static IdPFAMemoryOfflined => -2147483642

    /**
     * Native name: WheaEventLogEntryIdPFAMemoryRemoveMonitor
     * @type {Integer (Int32)}
     */
    static IdPFAMemoryRemoveMonitor => -2147483641

    /**
     * Native name: WheaEventLogEntryIdPFAMemoryPolicy
     * @type {Integer (Int32)}
     */
    static IdPFAMemoryPolicy => -2147483640

    /**
     * Native name: WheaEventLogEntryIdPshedInjectError
     * @type {Integer (Int32)}
     */
    static PshedInjectError => -2147483639

    /**
     * Native name: WheaEventLogEntryIdOscCapabilities
     * @type {Integer (Int32)}
     */
    static OscCapabilities => -2147483638

    /**
     * Native name: WheaEventLogEntryIdPshedPluginRegister
     * @type {Integer (Int32)}
     */
    static PshedPluginRegister => -2147483637

    /**
     * Native name: WheaEventLogEntryIdAddRemoveErrorSource
     * @type {Integer (Int32)}
     */
    static AddRemoveErrorSource => -2147483636

    /**
     * Native name: WheaEventLogEntryIdWorkQueueItem
     * @type {Integer (Int32)}
     */
    static WorkQueueItem => -2147483635

    /**
     * Native name: WheaEventLogEntryIdAttemptErrorRecovery
     * @type {Integer (Int32)}
     */
    static AttemptErrorRecovery => -2147483634

    /**
     * Native name: WheaEventLogEntryIdMcaFoundErrorInBank
     * @type {Integer (Int32)}
     */
    static McaFoundErrorInBank => -2147483633

    /**
     * Native name: WheaEventLogEntryIdMcaStuckErrorCheck
     * @type {Integer (Int32)}
     */
    static McaStuckErrorCheck => -2147483632

    /**
     * Native name: WheaEventLogEntryIdMcaErrorCleared
     * @type {Integer (Int32)}
     */
    static McaErrorCleared => -2147483631

    /**
     * Native name: WheaEventLogEntryIdClearedPoison
     * @type {Integer (Int32)}
     */
    static ClearedPoison => -2147483630

    /**
     * Native name: WheaEventLogEntryIdProcessEINJ
     * @type {Integer (Int32)}
     */
    static ProcessEINJ => -2147483629

    /**
     * Native name: WheaEventLogEntryIdProcessHEST
     * @type {Integer (Int32)}
     */
    static ProcessHEST => -2147483628

    /**
     * Native name: WheaEventLogEntryIdCreateGenericRecord
     * @type {Integer (Int32)}
     */
    static CreateGenericRecord => -2147483627

    /**
     * Native name: WheaEventLogEntryIdErrorRecord
     * @type {Integer (Int32)}
     */
    static ErrorRecord => -2147483626

    /**
     * Native name: WheaEventLogEntryIdErrorRecordLimit
     * @type {Integer (Int32)}
     */
    static ErrorRecordLimit => -2147483625

    /**
     * Native name: WheaEventLogEntryIdAerNotGrantedToOs
     * @type {Integer (Int32)}
     */
    static AerNotGrantedToOs => -2147483624

    /**
     * Native name: WheaEventLogEntryIdErrSrcArrayInvalid
     * @type {Integer (Int32)}
     */
    static ErrSrcArrayInvalid => -2147483623

    /**
     * Native name: WheaEventLogEntryIdAcpiTimeOut
     * @type {Integer (Int32)}
     */
    static AcpiTimeOut => -2147483622

    /**
     * Native name: WheaEventLogCmciRestart
     * @type {Integer (Int32)}
     */
    static CmciRestart => -2147483621

    /**
     * Native name: WheaEventLogCmciFinalRestart
     * @type {Integer (Int32)}
     */
    static CmciFinalRestart => -2147483620

    /**
     * Native name: WheaEventLogEntryEtwOverFlow
     * @type {Integer (Int32)}
     */
    static EtwOverFlow => -2147483619

    /**
     * Native name: WheaEventLogAzccRootBusSearchErr
     * @type {Integer (Int32)}
     */
    static AzccRootBusSearchErr => -2147483618

    /**
     * Native name: WheaEventLogAzccRootBusList
     * @type {Integer (Int32)}
     */
    static AzccRootBusList => -2147483617

    /**
     * Native name: WheaEventLogEntryIdErrSrcInvalid
     * @type {Integer (Int32)}
     */
    static ErrSrcInvalid => -2147483616

    /**
     * Native name: WheaEventLogEntryIdGenericErrMemMap
     * @type {Integer (Int32)}
     */
    static GenericErrMemMap => -2147483615

    /**
     * Native name: WheaEventLogEntryIdPshedCallbackCollision
     * @type {Integer (Int32)}
     */
    static PshedCallbackCollision => -2147483614

    /**
     * Native name: WheaEventLogEntryIdSELBugCheckProgress
     * @type {Integer (Int32)}
     */
    static IdSELBugCheckProgress => -2147483613

    /**
     * Native name: WheaEventLogEntryIdPshedPluginLoad
     * @type {Integer (Int32)}
     */
    static PshedPluginLoad => -2147483612

    /**
     * Native name: WheaEventLogEntryIdPshedPluginUnload
     * @type {Integer (Int32)}
     */
    static PshedPluginUnload => -2147483611

    /**
     * Native name: WheaEventLogEntryIdPshedPluginSupported
     * @type {Integer (Int32)}
     */
    static PshedPluginSupported => -2147483610

    /**
     * Native name: WheaEventLogEntryIdDeviceDriver
     * @type {Integer (Int32)}
     */
    static DeviceDriver => -2147483609

    /**
     * Native name: WheaEventLogEntryIdCmciImplPresent
     * @type {Integer (Int32)}
     */
    static CmciImplPresent => -2147483608

    /**
     * Native name: WheaEventLogEntryIdCmciInitError
     * @type {Integer (Int32)}
     */
    static CmciInitError => -2147483607

    /**
     * Native name: WheaEventLogEntryIdSELBugCheckRecovery
     * @type {Integer (Int32)}
     */
    static IdSELBugCheckRecovery => -2147483606

    /**
     * Native name: WheaEventLogEntryIdDrvErrSrcInvalid
     * @type {Integer (Int32)}
     */
    static DrvErrSrcInvalid => -2147483605

    /**
     * Native name: WheaEventLogEntryIdDrvHandleBusy
     * @type {Integer (Int32)}
     */
    static DrvHandleBusy => -2147483604

    /**
     * Native name: WheaEventLogEntryIdWheaHeartbeat
     * @type {Integer (Int32)}
     */
    static WheaHeartbeat => -2147483603

    /**
     * Native name: WheaEventLogAzccRootBusPoisonSet
     * @type {Integer (Int32)}
     */
    static AzccRootBusPoisonSet => -2147483602

    /**
     * Native name: WheaEventLogEntryIdSELBugCheckInfo
     * @type {Integer (Int32)}
     */
    static IdSELBugCheckInfo => -2147483601

    /**
     * Native name: WheaEventLogEntryIdErrDimmInfoMismatch
     * @type {Integer (Int32)}
     */
    static ErrDimmInfoMismatch => -2147483600

    /**
     * Native name: WheaEventLogEntryIdeDpcEnabled
     * @type {Integer (Int32)}
     */
    static IdeDpcEnabled => -2147483599

    /**
     * Native name: WheaEventLogEntryPageOfflineDone
     * @type {Integer (Int32)}
     */
    static PageOfflineDone => -2147483598

    /**
     * Native name: WheaEventLogEntryPageOfflinePendMax
     * @type {Integer (Int32)}
     */
    static PageOfflinePendMax => -2147483597

    /**
     * Native name: WheaEventLogEntryIdBadPageLimitReached
     * @type {Integer (Int32)}
     */
    static BadPageLimitReached => -2147483596

    /**
     * Native name: WheaEventLogEntrySrarDetail
     * @type {Integer (Int32)}
     */
    static SrarDetail => -2147483595

    /**
     * Native name: WheaEventLogEntryEarlyError
     * @type {Integer (Int32)}
     */
    static EarlyError => -2147483594

    /**
     * Native name: WheaEventLogEntryIdPcieOverrideInfo
     * @type {Integer (Int32)}
     */
    static PcieOverrideInfo => -2147483593

    /**
     * Native name: WheaEventLogEntryIdReadPcieOverridesErr
     * @type {Integer (Int32)}
     */
    static ReadPcieOverridesErr => -2147483592

    /**
     * Native name: WheaEventLogEntryIdPcieConfigInfo
     * @type {Integer (Int32)}
     */
    static PcieConfigInfo => -2147483591

    /**
     * Native name: WheaEventLogEntryIdPcieSummaryFailed
     * @type {Integer (Int32)}
     */
    static PcieSummaryFailed => -2147483584

    /**
     * Native name: WheaEventLogEntryIdThrottleRegCorrupt
     * @type {Integer (Int32)}
     */
    static ThrottleRegCorrupt => -2147483583

    /**
     * Native name: WheaEventLogEntryIdThrottleAddErrSrcFailed
     * @type {Integer (Int32)}
     */
    static ThrottleAddErrSrcFailed => -2147483582

    /**
     * Native name: WheaEventLogEntryIdThrottleRegDataIgnored
     * @type {Integer (Int32)}
     */
    static ThrottleRegDataIgnored => -2147483581

    /**
     * Native name: WheaEventLogEntryIdEnableKeyNotifFailed
     * @type {Integer (Int32)}
     */
    static EnableKeyNotifFailed => -2147483580

    /**
     * Native name: WheaEventLogEntryIdKeyNotificationFailed
     * @type {Integer (Int32)}
     */
    static KeyNotificationFailed => -2147483579

    /**
     * Native name: WheaEventLogEntryIdPcieRemoveDevice
     * @type {Integer (Int32)}
     */
    static PcieRemoveDevice => -2147483578

    /**
     * Native name: WheaEventLogEntryIdPcieAddDevice
     * @type {Integer (Int32)}
     */
    static PcieAddDevice => -2147483577

    /**
     * Native name: WheaEventLogEntryIdPcieSpuriousErrSource
     * @type {Integer (Int32)}
     */
    static PcieSpuriousErrSource => -2147483576

    /**
     * Native name: WheaEventLogEntryIdMemoryAddDevice
     * @type {Integer (Int32)}
     */
    static MemoryAddDevice => -2147483575

    /**
     * Native name: WheaEventLogEntryIdMemoryRemoveDevice
     * @type {Integer (Int32)}
     */
    static MemoryRemoveDevice => -2147483574

    /**
     * Native name: WheaEventLogEntryIdMemorySummaryFailed
     * @type {Integer (Int32)}
     */
    static MemorySummaryFailed => -2147483573

    /**
     * Native name: WheaEventLogEntryIdPcieDpcError
     * @type {Integer (Int32)}
     */
    static PcieDpcError => -2147483572

    /**
     * Native name: WheaEventLogEntryIdCpuBusesInitFailed
     * @type {Integer (Int32)}
     */
    static CpuBusesInitFailed => -2147483571

    /**
     * Native name: WheaEventLogEntryIdPshedPluginInitFailed
     * @type {Integer (Int32)}
     */
    static PshedPluginInitFailed => -2147483570

    /**
     * Native name: WheaEventLogEntryIdFailedAddToDefectList
     * @type {Integer (Int32)}
     */
    static FailedAddToDefectList => -2147483569

    /**
     * Native name: WheaEventLogEntryIdDefectListFull
     * @type {Integer (Int32)}
     */
    static DefectListFull => -2147483568

    /**
     * Native name: WheaEventLogEntryIdDefectListUEFIVarFailed
     * @type {Integer (Int32)}
     */
    static DefectListUEFIVarFailed => -2147483567

    /**
     * Native name: WheaEventLogEntryIdDefectListCorrupt
     * @type {Integer (Int32)}
     */
    static DefectListCorrupt => -2147483566

    /**
     * Native name: WheaEventLogEntryIdBadHestNotifyData
     * @type {Integer (Int32)}
     */
    static BadHestNotifyData => -2147483565

    /**
     * Native name: WheaEventLogEntryIdSrasTableNotFound
     * @type {Integer (Int32)}
     */
    static SrasTableNotFound => -2147483564

    /**
     * Native name: WheaEventLogEntryIdSrasTableError
     * @type {Integer (Int32)}
     */
    static SrasTableError => -2147483563

    /**
     * Native name: WheaEventLogEntryIdSrasTableEntries
     * @type {Integer (Int32)}
     */
    static SrasTableEntries => -2147483562

    /**
     * Native name: WheaEventLogEntryIdRowFailure
     * @type {Integer (Int32)}
     */
    static RowFailure => -2147483561

    /**
     * Native name: WheaEventLogEntryIdCpusFrozen
     * @type {Integer (Int32)}
     */
    static CpusFrozen => -2147483552

    /**
     * Native name: WheaEventLogEntryIdCpusFrozenNoCrashDump
     * @type {Integer (Int32)}
     */
    static CpusFrozenNoCrashDump => -2147483551

    /**
     * Native name: WheaEventLogEntryIdPshedPiTraceLog
     * @type {Integer (Int32)}
     */
    static PshedPiTraceLog => -2147221488
}
