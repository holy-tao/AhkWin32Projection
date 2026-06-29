#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_SYSTEM_PERFORMANCE_INFORMATION_2 {
    #StructPack 8

    IdleProcessTime : Int64

    IoReadTransferCount : Int64

    IoWriteTransferCount : Int64

    IoOtherTransferCount : Int64

    IoReadOperationCount : UInt32

    IoWriteOperationCount : UInt32

    IoOtherOperationCount : UInt32

    AvailablePages : UInt32

    CommittedPages : UInt32

    CommitLimit : UInt32

    PeakCommitment : UInt32

    PageFaultCount : UInt32

    CopyOnWriteCount : UInt32

    TransitionCount : UInt32

    CacheTransitionCount : UInt32

    DemandZeroCount : UInt32

    PageReadCount : UInt32

    PageReadIoCount : UInt32

    CacheReadCount : UInt32

    CacheIoCount : UInt32

    DirtyPagesWriteCount : UInt32

    DirtyWriteIoCount : UInt32

    MappedPagesWriteCount : UInt32

    MappedWriteIoCount : UInt32

    PagedPoolPages : UInt32

    NonPagedPoolPages : UInt32

    PagedPoolAllocs : UInt32

    PagedPoolFrees : UInt32

    NonPagedPoolAllocs : UInt32

    NonPagedPoolFrees : UInt32

    FreeSystemPtes : UInt32

    ResidentSystemCodePage : UInt32

    TotalSystemDriverPages : UInt32

    TotalSystemCodePages : UInt32

    NonPagedPoolLookasideHits : UInt32

    PagedPoolLookasideHits : UInt32

    AvailablePagedPoolPages : UInt32

    ResidentSystemCachePage : UInt32

    ResidentPagedPoolPage : UInt32

    ResidentSystemDriverPage : UInt32

    CcFastReadNoWait : UInt32

    CcFastReadWait : UInt32

    CcFastReadResourceMiss : UInt32

    CcFastReadNotPossible : UInt32

    CcFastMdlReadNoWait : UInt32

    CcFastMdlReadWait : UInt32

    CcFastMdlReadResourceMiss : UInt32

    CcFastMdlReadNotPossible : UInt32

    CcMapDataNoWait : UInt32

    CcMapDataWait : UInt32

    CcMapDataNoWaitMiss : UInt32

    CcMapDataWaitMiss : UInt32

    CcPinMappedDataCount : UInt32

    CcPinReadNoWait : UInt32

    CcPinReadWait : UInt32

    CcPinReadNoWaitMiss : UInt32

    CcPinReadWaitMiss : UInt32

    CcCopyReadNoWait : UInt32

    CcCopyReadWait : UInt32

    CcCopyReadNoWaitMiss : UInt32

    CcCopyReadWaitMiss : UInt32

    CcMdlReadNoWait : UInt32

    CcMdlReadWait : UInt32

    CcMdlReadNoWaitMiss : UInt32

    CcMdlReadWaitMiss : UInt32

    CcReadAheadIos : UInt32

    CcLazyWriteIos : UInt32

    CcLazyWritePages : UInt32

    CcDataFlushes : UInt32

    CcDataPages : UInt32

    ContextSwitches : UInt32

    FirstLevelTbFills : UInt32

    SecondLevelTbFills : UInt32

    SystemCalls : UInt32

    CcTotalDirtyPages : Int64

    CcDirtyPageThreshold : Int64

    ResidentAvailablePages : Int64

    SharedCommittedPages : Int64

    MdlPagesAllocated : Int64

    PfnDatabaseCommittedPages : Int64

    SystemPageTableCommittedPages : Int64

    ContiguousPagesAllocated : Int64

}
