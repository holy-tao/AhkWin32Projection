#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct VOLUME_REFS_INFO_BUFFER {
    #StructPack 8

    CacheSizeInBytes : Int64

    AllocatedCacheInBytes : Int64

    PopulatedCacheInBytes : Int64

    InErrorCacheInBytes : Int64

    MemoryUsedForCacheMetadata : Int64

    CacheLineSize : UInt32

    CacheTransactionsOutstanding : Int32

    CacheLinesFree : Int32

    CacheLinesInError : Int32

    CacheHitsInBytes : Int64

    CacheMissesInBytes : Int64

    CachePopulationUpdatesInBytes : Int64

    CacheWriteThroughUpdatesInBytes : Int64

    CacheInvalidationsInBytes : Int64

    CacheOverReadsInBytes : Int64

    MetadataWrittenBytes : Int64

    CacheHitCounter : Int32

    CacheMissCounter : Int32

    CacheLineAllocationCounter : Int32

    CacheInvalidationsCounter : Int32

    CachePopulationUpdatesCounter : Int32

    CacheWriteThroughUpdatesCounter : Int32

    MaxCacheTransactionsOutstanding : Int32

    DataWritesReallocationCount : Int32

    DataInPlaceWriteCount : Int32

    MetadataAllocationsFastTierCount : Int32

    MetadataAllocationsSlowTierCount : Int32

    DataAllocationsFastTierCount : Int32

    DataAllocationsSlowTierCount : Int32

    DestagesSlowTierToFastTier : Int32

    DestagesFastTierToSlowTier : Int32

    SlowTierDataFillRatio : Int32

    FastTierDataFillRatio : Int32

    SlowTierMetadataFillRatio : Int32

    FastTierMetadataFillRatio : Int32

    SlowToFastDestageReadLatency : Int32

    SlowToFastDestageReadLatencyBase : Int32

    SlowToFastDestageWriteLatency : Int32

    SlowToFastDestageWriteLatencyBase : Int32

    FastToSlowDestageReadLatency : Int32

    FastToSlowDestageReadLatencyBase : Int32

    FastToSlowDestageWriteLatency : Int32

    FastToSlowDestageWriteLatencyBase : Int32

    SlowTierContainerFillRatio : Int32

    SlowTierContainerFillRatioBase : Int32

    FastTierContainerFillRatio : Int32

    FastTierContainerFillRatioBase : Int32

    TreeUpdateLatency : Int32

    TreeUpdateLatencyBase : Int32

    CheckpointLatency : Int32

    CheckpointLatencyBase : Int32

    TreeUpdateCount : Int32

    CheckpointCount : Int32

    LogWriteCount : Int32

    LogFillRatio : Int32

    ReadCacheInvalidationsForOverwrite : Int32

    ReadCacheInvalidationsForReuse : Int32

    ReadCacheInvalidationsGeneral : Int32

    ReadCacheChecksOnMount : Int32

    ReadCacheIssuesOnMount : Int32

    TrimLatency : Int32

    TrimLatencyBase : Int32

    DataCompactionCount : Int32

    CompactionReadLatency : Int32

    CompactionReadLatencyBase : Int32

    CompactionWriteLatency : Int32

    CompactionWriteLatencyBase : Int32

    DataInPlaceWriteClusterCount : Int64

    CompactionFailedDueToIneligibleContainer : Int32

    CompactionFailedDueToMaxFragmentation : Int32

    CompactedContainerFillRatio : Int32

    CompactedContainerFillRatioBase : Int32

    ContainerMoveRetryCount : Int32

    ContainerMoveFailedDueToIneligibleContainer : Int32

    CompactionFailureCount : Int32

    ContainerMoveFailureCount : Int32

    NumberOfDirtyMetadataPages : Int64

    NumberOfDirtyTableListEntries : Int32

    NumberOfDeleteQueueEntries : Int32

}
