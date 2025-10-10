#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of shadow copy protection faults.
 * @see https://docs.microsoft.com/windows/win32/api//vsmgmt/ne-vsmgmt-vss_protection_fault
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_PROTECTION_FAULT{

    /**
     * No shadow copy protection fault has occurred.
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_NONE => 0

    /**
     * The volume that contains the shadow copy storage area could not be found. Usually this fault means that the volume has not yet arrived in the system.
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_DIFF_AREA_MISSING => 1

    /**
     * The volume that contains the shadow copy storage area could not be brought online because an I/O  failure occurred.
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_IO_FAILURE_DURING_ONLINE => 2

    /**
     * The shadow copy metadata for the shadow copy storage area has been corrupted.
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_META_DATA_CORRUPTION => 3

    /**
     * A memory allocation failure occurred. This could be caused by a temporary low-memory condition that does  not happen again after you clear the fault and restart the shadow copy operation.
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_MEMORY_ALLOCATION_FAILURE => 4

    /**
     * A memory mapping failure occurred. This fault could mean that the  page file is too small, or it could be caused by a low-memory condition.
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_MAPPED_MEMORY_FAILURE => 5

    /**
     * A read failure occurred during the copy-on-write operation when data was being copied from the live volume to the shadow copy storage area volume.
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_COW_READ_FAILURE => 6

    /**
     * A read or write failure occurred during the copy-on-write operation when data was being copied from the live volume to the shadow copy storage area volume. One possible reason is that the shadow copy storage area volume has been removed from the system.
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_COW_WRITE_FAILURE => 7

    /**
     * This failure means that either the shadow copy storage area is full or the shadow copy storage area volume is full. After clearing the protection fault, you can do one of the following:
 * 
 * <ul>
 * <li>Delete unused shadow copy storage areas by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3-deleteunuseddiffareas">IVssDifferentialSoftwareSnapshotMgmt3::DeleteUnusedDiffAreas</a> method.</li>
 * <li>Increase the shadow copy storage area maximum size for the volume by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt-changediffareamaximumsize">IVssDifferentialSoftwareSnapshotMgmt::ChangeDiffAreaMaximumSize</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt2-changediffareamaximumsizeex">IVssDifferentialSoftwareSnapshotMgmt2::ChangeDiffAreaMaximumSizeEx</a> method.</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_DIFF_AREA_FULL => 8

    /**
     * The size of the shadow copy storage area could not be increased because there was no longer enough space on the shadow copy storage area volume.
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_GROW_TOO_SLOW => 9

    /**
     * The size of the shadow copy storage area could not be increased.
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_GROW_FAILED => 10

    /**
     * An unexpected error occurred.
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_DESTROY_ALL_SNAPSHOTS => 11

    /**
     * Either the shadow copy storage area files could not be opened or the shadow copy storage area volume could not be mounted because of a file system operation failure.
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_FILE_SYSTEM_FAILURE => 12

    /**
     * A read or write failure occurred on the shadow copy storage area volume.
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_IO_FAILURE => 13

    /**
     * The shadow copy storage area volume was removed from the system or could not be accessed for some other reason.
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_DIFF_AREA_REMOVED => 14

    /**
     * Another application attempted to write  to the shadow copy storage area.
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_EXTERNAL_WRITER_TO_DIFF_AREA => 15

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_FAULT_MOUNT_DURING_CLUSTER_OFFLINE => 16
}
