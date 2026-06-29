#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRJ_NOTIFICATION_MAPPING.ahk" { PRJ_NOTIFICATION_MAPPING }
#Import ".\PRJ_STARTVIRTUALIZING_FLAGS.ahk" { PRJ_STARTVIRTUALIZING_FLAGS }

/**
 * Options to provide when starting a virtualization instance.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_startvirtualizing_options
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_STARTVIRTUALIZING_OPTIONS {
    #StructPack 8

    /**
     * A flag for starting virtualization.
     */
    Flags : PRJ_STARTVIRTUALIZING_FLAGS

    /**
     * The number of threads the provider wants to create to service callbacks.
     */
    PoolThreadCount : UInt32

    /**
     * The maximum number of threads the provider wants to run concurrently to process callbacks.
     */
    ConcurrentThreadCount : UInt32

    /**
     * An array of zero or more notification mappings. See the Remarks section of PRJ_NOTIFICATION MAPPING for more details.
     */
    NotificationMappings : PRJ_NOTIFICATION_MAPPING.Ptr

    /**
     * The number of notification mappings provided in NotificationMappings.
     */
    NotificationMappingsCount : UInt32

}
