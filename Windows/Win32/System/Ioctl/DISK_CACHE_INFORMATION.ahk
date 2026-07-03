#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DISK_CACHE_RETENTION_PRIORITY.ahk" { DISK_CACHE_RETENTION_PRIORITY }

/**
 * Provides information about the disk cache.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-disk_cache_information
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DISK_CACHE_INFORMATION {
    #StructPack 4


    struct _ScalarPrefetch {
        Minimum : UInt16

        Maximum : UInt16

        MaximumBlocks : UInt16

    }

    struct _BlockPrefetch {
        Minimum : UInt16

        Maximum : UInt16

    }

    /**
     * Indicates whether the device is capable of saving any parameters in nonvolatile storage.
     */
    ParametersSavable : BOOLEAN

    /**
     * Indicates whether the read cache is enabled.
     */
    ReadCacheEnabled : BOOLEAN

    /**
     * Indicates whether the write cache is enabled.
     */
    WriteCacheEnabled : BOOLEAN

    /**
     * Determines the likelihood of data cached from a read operation remaining in the cache. This data might be given a different priority than data cached under other circumstances, such as from a prefetch operation.
     */
    ReadRetentionPriority : DISK_CACHE_RETENTION_PRIORITY

    /**
     * Determines the likelihood of data cached from a write operation remaining in the cache. This data might be given a different priority than data cached under other circumstances, such as from a prefetch operation.
     */
    WriteRetentionPriority : DISK_CACHE_RETENTION_PRIORITY

    /**
     * Disables prefetching. Prefetching might be disabled whenever the number of blocks requested exceeds the value in <i>DisablePrefetchTransferLength</i>. When zero, prefetching is disabled no matter what the size of the block request.
     */
    DisablePrefetchTransferLength : UInt16

    /**
     * If this member is  <b>TRUE</b>,  the union is a <b>ScalarPrefetch</b> structure. Otherwise, the union is a <b>BlockPrefetch</b> structure.
     */
    PrefetchScalar : BOOLEAN

    ScalarPrefetch : DISK_CACHE_INFORMATION._ScalarPrefetch

    static __New() {
        DefineProp(this.Prototype, 'BlockPrefetch', { type: DISK_CACHE_INFORMATION._BlockPrefetch, offset: 16 })
        this.DeleteProp("__New")
    }
}
