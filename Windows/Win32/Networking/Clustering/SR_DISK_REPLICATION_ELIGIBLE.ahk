#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the various reasons a disk on a cluster node can be eligible or ineligible for replication.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ne-clusapi-sr_disk_replication_eligible
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class SR_DISK_REPLICATION_ELIGIBLE extends Win32Enum{

    /**
     * None of the disks on the node are eligible for replication.
     * @type {Integer (Int32)}
     */
    static SrDiskReplicationEligibleNone => 0

    /**
     * The disk is eligible for replication.
     * @type {Integer (Int32)}
     */
    static SrDiskReplicationEligibleYes => 1

    /**
     * The disk is offline.
     * @type {Integer (Int32)}
     */
    static SrDiskReplicationEligibleOffline => 2

    /**
     * The disk is not formatted with a GUID partition table (GPT).
     * @type {Integer (Int32)}
     */
    static SrDiskReplicationEligibleNotGpt => 3

    /**
     * There are a different number of target and source partitions.
     * @type {Integer (Int32)}
     */
    static SrDiskReplicationEligiblePartitionLayoutMismatch => 4

    /**
     * There is not enough free space on the disk.
     * @type {Integer (Int32)}
     */
    static SrDiskReplicationEligibleInsufficientFreeSpace => 5

    /**
     * The disk is not on the same site at the target disk.
     * @type {Integer (Int32)}
     */
    static SrDiskReplicationEligibleNotInSameSite => 6

    /**
     * The disk is on the same site as the target disk.
     * @type {Integer (Int32)}
     */
    static SrDiskReplicationEligibleInSameSite => 7

    /**
     * The file system on the disk is not supported.
     * @type {Integer (Int32)}
     */
    static SrDiskReplicationEligibleFileSystemNotSupported => 8

    /**
     * The disk is already being replicated.
     * @type {Integer (Int32)}
     */
    static SrDiskReplicationEligibleAlreadyInReplication => 9

    /**
     * The disk is the target disk.
     * @type {Integer (Int32)}
     */
    static SrDiskReplicationEligibleSameAsSpecifiedDisk => 10

    /**
     * Other.
     * @type {Integer (Int32)}
     */
    static SrDiskReplicationEligibleOther => 9999
}
