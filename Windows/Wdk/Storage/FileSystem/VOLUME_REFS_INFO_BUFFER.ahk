#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class VOLUME_REFS_INFO_BUFFER extends Win32Struct
{
    static sizeof => 376

    static packingSize => 8

    /**
     * @type {Integer}
     */
    CacheSizeInBytes {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AllocatedCacheInBytes {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    PopulatedCacheInBytes {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    InErrorCacheInBytes {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    MemoryUsedForCacheMetadata {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    CacheLineSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    CacheTransactionsOutstanding {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    CacheLinesFree {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    CacheLinesInError {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    CacheHitsInBytes {
        get => NumGet(this, 56, "int64")
        set => NumPut("int64", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    CacheMissesInBytes {
        get => NumGet(this, 64, "int64")
        set => NumPut("int64", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CachePopulationUpdatesInBytes {
        get => NumGet(this, 72, "int64")
        set => NumPut("int64", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CacheWriteThroughUpdatesInBytes {
        get => NumGet(this, 80, "int64")
        set => NumPut("int64", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    CacheInvalidationsInBytes {
        get => NumGet(this, 88, "int64")
        set => NumPut("int64", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    CacheOverReadsInBytes {
        get => NumGet(this, 96, "int64")
        set => NumPut("int64", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    MetadataWrittenBytes {
        get => NumGet(this, 104, "int64")
        set => NumPut("int64", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    CacheHitCounter {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    CacheMissCounter {
        get => NumGet(this, 116, "int")
        set => NumPut("int", value, this, 116)
    }

    /**
     * @type {Integer}
     */
    CacheLineAllocationCounter {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    CacheInvalidationsCounter {
        get => NumGet(this, 124, "int")
        set => NumPut("int", value, this, 124)
    }

    /**
     * @type {Integer}
     */
    CachePopulationUpdatesCounter {
        get => NumGet(this, 128, "int")
        set => NumPut("int", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    CacheWriteThroughUpdatesCounter {
        get => NumGet(this, 132, "int")
        set => NumPut("int", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    MaxCacheTransactionsOutstanding {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    DataWritesReallocationCount {
        get => NumGet(this, 140, "int")
        set => NumPut("int", value, this, 140)
    }

    /**
     * @type {Integer}
     */
    DataInPlaceWriteCount {
        get => NumGet(this, 144, "int")
        set => NumPut("int", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    MetadataAllocationsFastTierCount {
        get => NumGet(this, 148, "int")
        set => NumPut("int", value, this, 148)
    }

    /**
     * @type {Integer}
     */
    MetadataAllocationsSlowTierCount {
        get => NumGet(this, 152, "int")
        set => NumPut("int", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    DataAllocationsFastTierCount {
        get => NumGet(this, 156, "int")
        set => NumPut("int", value, this, 156)
    }

    /**
     * @type {Integer}
     */
    DataAllocationsSlowTierCount {
        get => NumGet(this, 160, "int")
        set => NumPut("int", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    DestagesSlowTierToFastTier {
        get => NumGet(this, 164, "int")
        set => NumPut("int", value, this, 164)
    }

    /**
     * @type {Integer}
     */
    DestagesFastTierToSlowTier {
        get => NumGet(this, 168, "int")
        set => NumPut("int", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    SlowTierDataFillRatio {
        get => NumGet(this, 172, "int")
        set => NumPut("int", value, this, 172)
    }

    /**
     * @type {Integer}
     */
    FastTierDataFillRatio {
        get => NumGet(this, 176, "int")
        set => NumPut("int", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    SlowTierMetadataFillRatio {
        get => NumGet(this, 180, "int")
        set => NumPut("int", value, this, 180)
    }

    /**
     * @type {Integer}
     */
    FastTierMetadataFillRatio {
        get => NumGet(this, 184, "int")
        set => NumPut("int", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    SlowToFastDestageReadLatency {
        get => NumGet(this, 188, "int")
        set => NumPut("int", value, this, 188)
    }

    /**
     * @type {Integer}
     */
    SlowToFastDestageReadLatencyBase {
        get => NumGet(this, 192, "int")
        set => NumPut("int", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    SlowToFastDestageWriteLatency {
        get => NumGet(this, 196, "int")
        set => NumPut("int", value, this, 196)
    }

    /**
     * @type {Integer}
     */
    SlowToFastDestageWriteLatencyBase {
        get => NumGet(this, 200, "int")
        set => NumPut("int", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    FastToSlowDestageReadLatency {
        get => NumGet(this, 204, "int")
        set => NumPut("int", value, this, 204)
    }

    /**
     * @type {Integer}
     */
    FastToSlowDestageReadLatencyBase {
        get => NumGet(this, 208, "int")
        set => NumPut("int", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    FastToSlowDestageWriteLatency {
        get => NumGet(this, 212, "int")
        set => NumPut("int", value, this, 212)
    }

    /**
     * @type {Integer}
     */
    FastToSlowDestageWriteLatencyBase {
        get => NumGet(this, 216, "int")
        set => NumPut("int", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    SlowTierContainerFillRatio {
        get => NumGet(this, 220, "int")
        set => NumPut("int", value, this, 220)
    }

    /**
     * @type {Integer}
     */
    SlowTierContainerFillRatioBase {
        get => NumGet(this, 224, "int")
        set => NumPut("int", value, this, 224)
    }

    /**
     * @type {Integer}
     */
    FastTierContainerFillRatio {
        get => NumGet(this, 228, "int")
        set => NumPut("int", value, this, 228)
    }

    /**
     * @type {Integer}
     */
    FastTierContainerFillRatioBase {
        get => NumGet(this, 232, "int")
        set => NumPut("int", value, this, 232)
    }

    /**
     * @type {Integer}
     */
    TreeUpdateLatency {
        get => NumGet(this, 236, "int")
        set => NumPut("int", value, this, 236)
    }

    /**
     * @type {Integer}
     */
    TreeUpdateLatencyBase {
        get => NumGet(this, 240, "int")
        set => NumPut("int", value, this, 240)
    }

    /**
     * @type {Integer}
     */
    CheckpointLatency {
        get => NumGet(this, 244, "int")
        set => NumPut("int", value, this, 244)
    }

    /**
     * @type {Integer}
     */
    CheckpointLatencyBase {
        get => NumGet(this, 248, "int")
        set => NumPut("int", value, this, 248)
    }

    /**
     * @type {Integer}
     */
    TreeUpdateCount {
        get => NumGet(this, 252, "int")
        set => NumPut("int", value, this, 252)
    }

    /**
     * @type {Integer}
     */
    CheckpointCount {
        get => NumGet(this, 256, "int")
        set => NumPut("int", value, this, 256)
    }

    /**
     * @type {Integer}
     */
    LogWriteCount {
        get => NumGet(this, 260, "int")
        set => NumPut("int", value, this, 260)
    }

    /**
     * @type {Integer}
     */
    LogFillRatio {
        get => NumGet(this, 264, "int")
        set => NumPut("int", value, this, 264)
    }

    /**
     * @type {Integer}
     */
    ReadCacheInvalidationsForOverwrite {
        get => NumGet(this, 268, "int")
        set => NumPut("int", value, this, 268)
    }

    /**
     * @type {Integer}
     */
    ReadCacheInvalidationsForReuse {
        get => NumGet(this, 272, "int")
        set => NumPut("int", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    ReadCacheInvalidationsGeneral {
        get => NumGet(this, 276, "int")
        set => NumPut("int", value, this, 276)
    }

    /**
     * @type {Integer}
     */
    ReadCacheChecksOnMount {
        get => NumGet(this, 280, "int")
        set => NumPut("int", value, this, 280)
    }

    /**
     * @type {Integer}
     */
    ReadCacheIssuesOnMount {
        get => NumGet(this, 284, "int")
        set => NumPut("int", value, this, 284)
    }

    /**
     * @type {Integer}
     */
    TrimLatency {
        get => NumGet(this, 288, "int")
        set => NumPut("int", value, this, 288)
    }

    /**
     * @type {Integer}
     */
    TrimLatencyBase {
        get => NumGet(this, 292, "int")
        set => NumPut("int", value, this, 292)
    }

    /**
     * @type {Integer}
     */
    DataCompactionCount {
        get => NumGet(this, 296, "int")
        set => NumPut("int", value, this, 296)
    }

    /**
     * @type {Integer}
     */
    CompactionReadLatency {
        get => NumGet(this, 300, "int")
        set => NumPut("int", value, this, 300)
    }

    /**
     * @type {Integer}
     */
    CompactionReadLatencyBase {
        get => NumGet(this, 304, "int")
        set => NumPut("int", value, this, 304)
    }

    /**
     * @type {Integer}
     */
    CompactionWriteLatency {
        get => NumGet(this, 308, "int")
        set => NumPut("int", value, this, 308)
    }

    /**
     * @type {Integer}
     */
    CompactionWriteLatencyBase {
        get => NumGet(this, 312, "int")
        set => NumPut("int", value, this, 312)
    }

    /**
     * @type {Integer}
     */
    DataInPlaceWriteClusterCount {
        get => NumGet(this, 320, "int64")
        set => NumPut("int64", value, this, 320)
    }

    /**
     * @type {Integer}
     */
    CompactionFailedDueToIneligibleContainer {
        get => NumGet(this, 328, "int")
        set => NumPut("int", value, this, 328)
    }

    /**
     * @type {Integer}
     */
    CompactionFailedDueToMaxFragmentation {
        get => NumGet(this, 332, "int")
        set => NumPut("int", value, this, 332)
    }

    /**
     * @type {Integer}
     */
    CompactedContainerFillRatio {
        get => NumGet(this, 336, "int")
        set => NumPut("int", value, this, 336)
    }

    /**
     * @type {Integer}
     */
    CompactedContainerFillRatioBase {
        get => NumGet(this, 340, "int")
        set => NumPut("int", value, this, 340)
    }

    /**
     * @type {Integer}
     */
    ContainerMoveRetryCount {
        get => NumGet(this, 344, "int")
        set => NumPut("int", value, this, 344)
    }

    /**
     * @type {Integer}
     */
    ContainerMoveFailedDueToIneligibleContainer {
        get => NumGet(this, 348, "int")
        set => NumPut("int", value, this, 348)
    }

    /**
     * @type {Integer}
     */
    CompactionFailureCount {
        get => NumGet(this, 352, "int")
        set => NumPut("int", value, this, 352)
    }

    /**
     * @type {Integer}
     */
    ContainerMoveFailureCount {
        get => NumGet(this, 356, "int")
        set => NumPut("int", value, this, 356)
    }

    /**
     * @type {Integer}
     */
    NumberOfDirtyMetadataPages {
        get => NumGet(this, 360, "int64")
        set => NumPut("int64", value, this, 360)
    }

    /**
     * @type {Integer}
     */
    NumberOfDirtyTableListEntries {
        get => NumGet(this, 368, "int")
        set => NumPut("int", value, this, 368)
    }

    /**
     * @type {Integer}
     */
    NumberOfDeleteQueueEntries {
        get => NumGet(this, 372, "int")
        set => NumPut("int", value, this, 372)
    }
}
