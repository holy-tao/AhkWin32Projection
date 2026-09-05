#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the various reasons a disk on a cluster node can be eligible or ineligible for replication.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-sr_disk_replication_eligible
 * @namespace Windows.Win32.Networking.Clustering
 */
class SR_DISK_REPLICATION_ELIGIBLE extends Win32Enum {

    /**
     * None of the disks on the node are eligible for replication.
     * Native name: SrDiskReplicationEligibleNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The disk is eligible for replication.
     * Native name: SrDiskReplicationEligibleYes
     * @type {Integer (Int32)}
     */
    static Yes => 1

    /**
     * The disk is offline.
     * Native name: SrDiskReplicationEligibleOffline
     * @type {Integer (Int32)}
     */
    static Offline => 2

    /**
     * The disk is not formatted with a GUID partition table (GPT).
     * Native name: SrDiskReplicationEligibleNotGpt
     * @type {Integer (Int32)}
     */
    static NotGpt => 3

    /**
     * There are a different number of target and source partitions.
     * Native name: SrDiskReplicationEligiblePartitionLayoutMismatch
     * @type {Integer (Int32)}
     */
    static PartitionLayoutMismatch => 4

    /**
     * There is not enough free space on the disk.
     * Native name: SrDiskReplicationEligibleInsufficientFreeSpace
     * @type {Integer (Int32)}
     */
    static InsufficientFreeSpace => 5

    /**
     * The disk is not on the same site at the target disk.
     * Native name: SrDiskReplicationEligibleNotInSameSite
     * @type {Integer (Int32)}
     */
    static NotInSameSite => 6

    /**
     * The disk is on the same site as the target disk.
     * Native name: SrDiskReplicationEligibleInSameSite
     * @type {Integer (Int32)}
     */
    static InSameSite => 7

    /**
     * The file system on the disk is not supported.
     * Native name: SrDiskReplicationEligibleFileSystemNotSupported
     * @type {Integer (Int32)}
     */
    static FileSystemNotSupported => 8

    /**
     * The disk is already being replicated.
     * Native name: SrDiskReplicationEligibleAlreadyInReplication
     * @type {Integer (Int32)}
     */
    static AlreadyInReplication => 9

    /**
     * The disk is the target disk.
     * Native name: SrDiskReplicationEligibleSameAsSpecifiedDisk
     * @type {Integer (Int32)}
     */
    static SameAsSpecifiedDisk => 10

    /**
     * Other.
     * Native name: SrDiskReplicationEligibleOther
     * @type {Integer (Int32)}
     */
    static Other => 9999
}
