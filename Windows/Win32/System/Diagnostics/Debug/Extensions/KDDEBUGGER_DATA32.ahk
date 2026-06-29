#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Kernel\LIST_ENTRY32.ahk" { LIST_ENTRY32 }
#Import ".\DBGKD_DEBUG_DATA_HEADER32.ahk" { DBGKD_DEBUG_DATA_HEADER32 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct KDDEBUGGER_DATA32 {
    #StructPack 4

    Header : DBGKD_DEBUG_DATA_HEADER32

    KernBase : UInt32

    BreakpointWithStatus : UInt32

    SavedContext : UInt32

    ThCallbackStack : UInt16

    NextCallback : UInt16

    FramePointer : UInt16

    /**
     * This bitfield backs the following members:
     * - PaeEnabled
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    PaeEnabled {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    KiCallUserMode : UInt32

    KeUserCallbackDispatcher : UInt32

    PsLoadedModuleList : UInt32

    PsActiveProcessHead : UInt32

    PspCidTable : UInt32

    ExpSystemResourcesList : UInt32

    ExpPagedPoolDescriptor : UInt32

    ExpNumberOfPagedPools : UInt32

    KeTimeIncrement : UInt32

    KeBugCheckCallbackListHead : UInt32

    KiBugcheckData : UInt32

    IopErrorLogListHead : UInt32

    ObpRootDirectoryObject : UInt32

    ObpTypeObjectType : UInt32

    MmSystemCacheStart : UInt32

    MmSystemCacheEnd : UInt32

    MmSystemCacheWs : UInt32

    MmPfnDatabase : UInt32

    MmSystemPtesStart : UInt32

    MmSystemPtesEnd : UInt32

    MmSubsectionBase : UInt32

    MmNumberOfPagingFiles : UInt32

    MmLowestPhysicalPage : UInt32

    MmHighestPhysicalPage : UInt32

    MmNumberOfPhysicalPages : UInt32

    MmMaximumNonPagedPoolInBytes : UInt32

    MmNonPagedSystemStart : UInt32

    MmNonPagedPoolStart : UInt32

    MmNonPagedPoolEnd : UInt32

    MmPagedPoolStart : UInt32

    MmPagedPoolEnd : UInt32

    MmPagedPoolInformation : UInt32

    MmPageSize : UInt32

    MmSizeOfPagedPoolInBytes : UInt32

    MmTotalCommitLimit : UInt32

    MmTotalCommittedPages : UInt32

    MmSharedCommit : UInt32

    MmDriverCommit : UInt32

    MmProcessCommit : UInt32

    MmPagedPoolCommit : UInt32

    MmExtendedCommit : UInt32

    MmZeroedPageListHead : UInt32

    MmFreePageListHead : UInt32

    MmStandbyPageListHead : UInt32

    MmModifiedPageListHead : UInt32

    MmModifiedNoWritePageListHead : UInt32

    MmAvailablePages : UInt32

    MmResidentAvailablePages : UInt32

    PoolTrackTable : UInt32

    NonPagedPoolDescriptor : UInt32

    MmHighestUserAddress : UInt32

    MmSystemRangeStart : UInt32

    MmUserProbeAddress : UInt32

    KdPrintCircularBuffer : UInt32

    KdPrintCircularBufferEnd : UInt32

    KdPrintWritePointer : UInt32

    KdPrintRolloverCount : UInt32

    MmLoadedUserImageList : UInt32

}
