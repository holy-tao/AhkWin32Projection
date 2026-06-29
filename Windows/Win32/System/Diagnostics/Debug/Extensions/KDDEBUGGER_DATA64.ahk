#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Kernel\LIST_ENTRY64.ahk" { LIST_ENTRY64 }
#Import ".\DBGKD_DEBUG_DATA_HEADER64.ahk" { DBGKD_DEBUG_DATA_HEADER64 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct KDDEBUGGER_DATA64 {
    #StructPack 8

    Header : DBGKD_DEBUG_DATA_HEADER64

    KernBase : Int64

    BreakpointWithStatus : Int64

    SavedContext : Int64

    ThCallbackStack : UInt16

    NextCallback : UInt16

    FramePointer : UInt16

    /**
     * This bitfield backs the following members:
     * - PaeEnabled
     * - KiBugCheckRecoveryActive
     * - PagingLevels
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    PaeEnabled {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    KiBugCheckRecoveryActive {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    PagingLevels {
        get => (this._bitfield >> 2) & 0xF
        set => this._bitfield := ((value & 0xF) << 2) | (this._bitfield & ~(0xF << 2))
    }
    KiCallUserMode : Int64

    KeUserCallbackDispatcher : Int64

    PsLoadedModuleList : Int64

    PsActiveProcessHead : Int64

    PspCidTable : Int64

    ExpSystemResourcesList : Int64

    ExpPagedPoolDescriptor : Int64

    ExpNumberOfPagedPools : Int64

    KeTimeIncrement : Int64

    KeBugCheckCallbackListHead : Int64

    KiBugcheckData : Int64

    IopErrorLogListHead : Int64

    ObpRootDirectoryObject : Int64

    ObpTypeObjectType : Int64

    MmSystemCacheStart : Int64

    MmSystemCacheEnd : Int64

    MmSystemCacheWs : Int64

    MmPfnDatabase : Int64

    MmSystemPtesStart : Int64

    MmSystemPtesEnd : Int64

    MmSubsectionBase : Int64

    MmNumberOfPagingFiles : Int64

    MmLowestPhysicalPage : Int64

    MmHighestPhysicalPage : Int64

    MmNumberOfPhysicalPages : Int64

    MmMaximumNonPagedPoolInBytes : Int64

    MmNonPagedSystemStart : Int64

    MmNonPagedPoolStart : Int64

    MmNonPagedPoolEnd : Int64

    MmPagedPoolStart : Int64

    MmPagedPoolEnd : Int64

    MmPagedPoolInformation : Int64

    MmPageSize : Int64

    MmSizeOfPagedPoolInBytes : Int64

    MmTotalCommitLimit : Int64

    MmTotalCommittedPages : Int64

    MmSharedCommit : Int64

    MmDriverCommit : Int64

    MmProcessCommit : Int64

    MmPagedPoolCommit : Int64

    MmExtendedCommit : Int64

    MmZeroedPageListHead : Int64

    MmFreePageListHead : Int64

    MmStandbyPageListHead : Int64

    MmModifiedPageListHead : Int64

    MmModifiedNoWritePageListHead : Int64

    MmAvailablePages : Int64

    MmResidentAvailablePages : Int64

    PoolTrackTable : Int64

    NonPagedPoolDescriptor : Int64

    MmHighestUserAddress : Int64

    MmSystemRangeStart : Int64

    MmUserProbeAddress : Int64

    KdPrintCircularBuffer : Int64

    KdPrintCircularBufferEnd : Int64

    KdPrintWritePointer : Int64

    KdPrintRolloverCount : Int64

    MmLoadedUserImageList : Int64

    NtBuildLab : Int64

    KiNormalSystemCall : Int64

    KiProcessorBlock : Int64

    MmUnloadedDrivers : Int64

    MmLastUnloadedDriver : Int64

    MmTriageActionTaken : Int64

    MmSpecialPoolTag : Int64

    KernelVerifier : Int64

    MmVerifierData : Int64

    MmAllocatedNonPagedPool : Int64

    MmPeakCommitment : Int64

    MmTotalCommitLimitMaximum : Int64

    CmNtCSDVersion : Int64

    MmPhysicalMemoryBlock : Int64

    MmSessionBase : Int64

    MmSessionSize : Int64

    MmSystemParentTablePage : Int64

    MmVirtualTranslationBase : Int64

    OffsetKThreadNextProcessor : UInt16

    OffsetKThreadTeb : UInt16

    OffsetKThreadKernelStack : UInt16

    OffsetKThreadInitialStack : UInt16

    OffsetKThreadApcProcess : UInt16

    OffsetKThreadState : UInt16

    OffsetKThreadBStore : UInt16

    OffsetKThreadBStoreLimit : UInt16

    SizeEProcess : UInt16

    OffsetEprocessPeb : UInt16

    OffsetEprocessParentCID : UInt16

    OffsetEprocessDirectoryTableBase : UInt16

    SizePrcb : UInt16

    OffsetPrcbDpcRoutine : UInt16

    OffsetPrcbCurrentThread : UInt16

    OffsetPrcbMhz : UInt16

    OffsetPrcbCpuType : UInt16

    OffsetPrcbVendorString : UInt16

    OffsetPrcbProcStateContext : UInt16

    OffsetPrcbNumber : UInt16

    SizeEThread : UInt16

    L1tfHighPhysicalBitIndex : Int8

    L1tfSwizzleBitIndex : Int8

    Padding0 : UInt32

    KdPrintCircularBufferPtr : Int64

    KdPrintBufferSize : Int64

    KeLoaderBlock : Int64

    SizePcr : UInt16

    OffsetPcrSelfPcr : UInt16

    OffsetPcrCurrentPrcb : UInt16

    OffsetPcrContainedPrcb : UInt16

    OffsetPcrInitialBStore : UInt16

    OffsetPcrBStoreLimit : UInt16

    OffsetPcrInitialStack : UInt16

    OffsetPcrStackLimit : UInt16

    OffsetPrcbPcrPage : UInt16

    OffsetPrcbProcStateSpecialReg : UInt16

    GdtR0Code : UInt16

    GdtR0Data : UInt16

    GdtR0Pcr : UInt16

    GdtR3Code : UInt16

    GdtR3Data : UInt16

    GdtR3Teb : UInt16

    GdtLdt : UInt16

    GdtTss : UInt16

    Gdt64R3CmCode : UInt16

    Gdt64R3CmTeb : UInt16

    IopNumTriageDumpDataBlocks : Int64

    IopTriageDumpDataBlocks : Int64

    VfCrashDataBlock : Int64

    MmBadPagesDetected : Int64

    MmZeroedPageSingleBitErrorsDetected : Int64

    EtwpDebuggerData : Int64

    OffsetPrcbContext : UInt16

    OffsetPrcbMaxBreakpoints : UInt16

    OffsetPrcbMaxWatchpoints : UInt16

    OffsetKThreadStackLimit : UInt32

    OffsetKThreadStackBase : UInt32

    OffsetKThreadQueueListEntry : UInt32

    OffsetEThreadIrpList : UInt32

    OffsetPrcbIdleThread : UInt16

    OffsetPrcbNormalDpcState : UInt16

    OffsetPrcbDpcStack : UInt16

    OffsetPrcbIsrStack : UInt16

    SizeKDPC_STACK_FRAME : UInt16

    OffsetKPriQueueThreadListHead : UInt16

    OffsetKThreadWaitReason : UInt16

    Padding1 : UInt16

    PteBase : Int64

    RetpolineStubFunctionTable : Int64

    RetpolineStubFunctionTableSize : UInt32

    RetpolineStubOffset : UInt32

    RetpolineStubSize : UInt32

    OffsetEProcessMmHotPatchContext : UInt16

    OffsetKThreadShadowStackLimit : UInt32

    OffsetKThreadShadowStackBase : UInt32

    ShadowStackEnabled : Int64

    PointerAuthMask : Int64

    OffsetPrcbExceptionStack : UInt16

}
