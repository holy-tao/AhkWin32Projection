#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_EVENT_LOG_ENTRY_ID extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdCmcPollingTimeout => -2147483647

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdWheaInit => -2147483646

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdCmcSwitchToPolling => -2147483645

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdDroppedCorrectedError => -2147483644

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdStartedReportHwError => -2147483643

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPFAMemoryOfflined => -2147483642

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPFAMemoryRemoveMonitor => -2147483641

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPFAMemoryPolicy => -2147483640

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPshedInjectError => -2147483639

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdOscCapabilities => -2147483638

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPshedPluginRegister => -2147483637

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdAddRemoveErrorSource => -2147483636

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdWorkQueueItem => -2147483635

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdAttemptErrorRecovery => -2147483634

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdMcaFoundErrorInBank => -2147483633

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdMcaStuckErrorCheck => -2147483632

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdMcaErrorCleared => -2147483631

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdClearedPoison => -2147483630

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdProcessEINJ => -2147483629

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdProcessHEST => -2147483628

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdCreateGenericRecord => -2147483627

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdErrorRecord => -2147483626

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdErrorRecordLimit => -2147483625

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdAerNotGrantedToOs => -2147483624

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdErrSrcArrayInvalid => -2147483623

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdAcpiTimeOut => -2147483622

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogCmciRestart => -2147483621

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogCmciFinalRestart => -2147483620

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryEtwOverFlow => -2147483619

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogAzccRootBusSearchErr => -2147483618

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogAzccRootBusList => -2147483617

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdErrSrcInvalid => -2147483616

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdGenericErrMemMap => -2147483615

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPshedCallbackCollision => -2147483614

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdSELBugCheckProgress => -2147483613

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPshedPluginLoad => -2147483612

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPshedPluginUnload => -2147483611

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPshedPluginSupported => -2147483610

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdDeviceDriver => -2147483609

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdCmciImplPresent => -2147483608

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdCmciInitError => -2147483607

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdSELBugCheckRecovery => -2147483606

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdDrvErrSrcInvalid => -2147483605

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdDrvHandleBusy => -2147483604

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdWheaHeartbeat => -2147483603

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogAzccRootBusPoisonSet => -2147483602

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdSELBugCheckInfo => -2147483601

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdErrDimmInfoMismatch => -2147483600

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdeDpcEnabled => -2147483599

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryPageOfflineDone => -2147483598

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryPageOfflinePendMax => -2147483597

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdBadPageLimitReached => -2147483596

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntrySrarDetail => -2147483595

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryEarlyError => -2147483594

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPcieOverrideInfo => -2147483593

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdReadPcieOverridesErr => -2147483592

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPcieConfigInfo => -2147483591

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPcieSummaryFailed => -2147483584

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdThrottleRegCorrupt => -2147483583

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdThrottleAddErrSrcFailed => -2147483582

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdThrottleRegDataIgnored => -2147483581

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdEnableKeyNotifFailed => -2147483580

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdKeyNotificationFailed => -2147483579

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPcieRemoveDevice => -2147483578

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPcieAddDevice => -2147483577

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPcieSpuriousErrSource => -2147483576

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdMemoryAddDevice => -2147483575

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdMemoryRemoveDevice => -2147483574

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdMemorySummaryFailed => -2147483573

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPcieDpcError => -2147483572

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdCpuBusesInitFailed => -2147483571

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPshedPluginInitFailed => -2147483570

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdFailedAddToDefectList => -2147483569

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdDefectListFull => -2147483568

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdDefectListUEFIVarFailed => -2147483567

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdDefectListCorrupt => -2147483566

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdBadHestNotifyData => -2147483565

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdSrasTableNotFound => -2147483564

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdSrasTableError => -2147483563

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdSrasTableEntries => -2147483562

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdRowFailure => -2147483561

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdCpusFrozen => -2147483552

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdCpusFrozenNoCrashDump => -2147483551

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryIdPshedPiTraceLog => -2147221488
}
