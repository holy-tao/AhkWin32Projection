#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of status values for a virtual disk object.
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_VDISK_STATE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_VDISK_STATE</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vds/ne-vds-vds_vdisk_state
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_VDISK_STATE extends Win32Enum{

    /**
     * VDS was not able to identify the virtual disk's current status.
     * @type {Integer (Int32)}
     */
    static VDS_VST_UNKNOWN => 0

    /**
     * The virtual disk is has been added to the VDS virtual disk provider.
     * @type {Integer (Int32)}
     */
    static VDS_VST_ADDED => 1

    /**
     * A handle has been opened to the virtual disk file.
     * @type {Integer (Int32)}
     */
    static VDS_VST_OPEN => 2

    /**
     * The virtual disk is being attached
     * @type {Integer (Int32)}
     */
    static VDS_VST_ATTACH_PENDING => 3

    /**
     * The virtual disk is attached, but a handle has not been opened to the virtual disk file.
     * @type {Integer (Int32)}
     */
    static VDS_VST_ATTACHED_NOT_OPEN => 4

    /**
     * The virtual disk is attached and a handle has  been opened to the virtual disk file.
     * @type {Integer (Int32)}
     */
    static VDS_VST_ATTACHED => 5

    /**
     * The virtual disk is being detached and a handle is being opened to the virtual disk file.
     * @type {Integer (Int32)}
     */
    static VDS_VST_DETACH_PENDING => 6

    /**
     * The virtual disk is being compacted.
     * @type {Integer (Int32)}
     */
    static VDS_VST_COMPACTING => 7

    /**
     * The virtual disk is being merged.
     * @type {Integer (Int32)}
     */
    static VDS_VST_MERGING => 8

    /**
     * The virtual disk is being expanded.
     * @type {Integer (Int32)}
     */
    static VDS_VST_EXPANDING => 9

    /**
     * The virtual disk has been deleted.
     * @type {Integer (Int32)}
     */
    static VDS_VST_DELETED => 10

    /**
     * This value is reserved for system use.
     * @type {Integer (Int32)}
     */
    static VDS_VST_MAX => 11
}
