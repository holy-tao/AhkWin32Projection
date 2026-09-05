#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of status values for a virtual disk object.
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_VDISK_STATE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_VDISK_STATE</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vds/ne-vds-vds_vdisk_state
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_VDISK_STATE extends Win32Enum {

    /**
     * VDS was not able to identify the virtual disk's current status.
     * Native name: VDS_VST_UNKNOWN
     * @type {Integer (Int32)}
     */
    static VST_UNKNOWN => 0

    /**
     * The virtual disk is has been added to the VDS virtual disk provider.
     * Native name: VDS_VST_ADDED
     * @type {Integer (Int32)}
     */
    static VST_ADDED => 1

    /**
     * A handle has been opened to the virtual disk file.
     * Native name: VDS_VST_OPEN
     * @type {Integer (Int32)}
     */
    static VST_OPEN => 2

    /**
     * The virtual disk is being attached
     * Native name: VDS_VST_ATTACH_PENDING
     * @type {Integer (Int32)}
     */
    static VST_ATTACH_PENDING => 3

    /**
     * The virtual disk is attached, but a handle has not been opened to the virtual disk file.
     * Native name: VDS_VST_ATTACHED_NOT_OPEN
     * @type {Integer (Int32)}
     */
    static VST_ATTACHED_NOT_OPEN => 4

    /**
     * The virtual disk is attached and a handle has  been opened to the virtual disk file.
     * Native name: VDS_VST_ATTACHED
     * @type {Integer (Int32)}
     */
    static VST_ATTACHED => 5

    /**
     * The virtual disk is being detached and a handle is being opened to the virtual disk file.
     * Native name: VDS_VST_DETACH_PENDING
     * @type {Integer (Int32)}
     */
    static VST_DETACH_PENDING => 6

    /**
     * The virtual disk is being compacted.
     * Native name: VDS_VST_COMPACTING
     * @type {Integer (Int32)}
     */
    static VST_COMPACTING => 7

    /**
     * The virtual disk is being merged.
     * Native name: VDS_VST_MERGING
     * @type {Integer (Int32)}
     */
    static VST_MERGING => 8

    /**
     * The virtual disk is being expanded.
     * Native name: VDS_VST_EXPANDING
     * @type {Integer (Int32)}
     */
    static VST_EXPANDING => 9

    /**
     * The virtual disk has been deleted.
     * Native name: VDS_VST_DELETED
     * @type {Integer (Int32)}
     */
    static VST_DELETED => 10

    /**
     * This value is reserved for system use.
     * Native name: VDS_VST_MAX
     * @type {Integer (Int32)}
     */
    static VST_MAX => 11
}
