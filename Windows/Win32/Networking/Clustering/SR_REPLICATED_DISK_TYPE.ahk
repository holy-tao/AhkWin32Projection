#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the replicated disk types for the SR_RESOURCE_TYPE_REPLICATED_DISK structure.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-sr_replicated_disk_type
 * @namespace Windows.Win32.Networking.Clustering
 */
class SR_REPLICATED_DISK_TYPE extends Win32Enum {

    /**
     * None.
     * Native name: SrReplicatedDiskTypeNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The source of replication.
     * Native name: SrReplicatedDiskTypeSource
     * @type {Integer (Int32)}
     */
    static Source => 1

    /**
     * A log disk that is the source of replication.
     * Native name: SrReplicatedDiskTypeLogSource
     * @type {Integer (Int32)}
     */
    static LogSource => 2

    /**
     * The destination of replication.
     * Native name: SrReplicatedDiskTypeDestination
     * @type {Integer (Int32)}
     */
    static Destination => 3

    /**
     * A log disk that is the destination of replication.
     * Native name: SrReplicatedDiskTypeLogDestination
     * @type {Integer (Int32)}
     */
    static LogDestination => 4

    /**
     * The disk is not in a replication partnership.
     * Native name: SrReplicatedDiskTypeNotInParthership
     * @type {Integer (Int32)}
     */
    static NotInParthership => 5

    /**
     * A log disk that is not in a replication partnership.
     * Native name: SrReplicatedDiskTypeLogNotInParthership
     * @type {Integer (Int32)}
     */
    static LogNotInParthership => 6

    /**
     * Other.
     * Native name: SrReplicatedDiskTypeOther
     * @type {Integer (Int32)}
     */
    static Other => 7
}
