#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the replicated disk types for the SR_RESOURCE_TYPE_REPLICATED_DISK structure.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ne-clusapi-sr_replicated_disk_type
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class SR_REPLICATED_DISK_TYPE extends Win32Enum{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static SrReplicatedDiskTypeNone => 0

    /**
     * The source of replication.
     * @type {Integer (Int32)}
     */
    static SrReplicatedDiskTypeSource => 1

    /**
     * A log disk that is the source of replication.
     * @type {Integer (Int32)}
     */
    static SrReplicatedDiskTypeLogSource => 2

    /**
     * The destination of replication.
     * @type {Integer (Int32)}
     */
    static SrReplicatedDiskTypeDestination => 3

    /**
     * A log disk that is the destination of replication.
     * @type {Integer (Int32)}
     */
    static SrReplicatedDiskTypeLogDestination => 4

    /**
     * The disk is not in a replication partnership.
     * @type {Integer (Int32)}
     */
    static SrReplicatedDiskTypeNotInParthership => 5

    /**
     * A log disk that is not in a replication partnership.
     * @type {Integer (Int32)}
     */
    static SrReplicatedDiskTypeLogNotInParthership => 6

    /**
     * Other.
     * @type {Integer (Int32)}
     */
    static SrReplicatedDiskTypeOther => 7
}
